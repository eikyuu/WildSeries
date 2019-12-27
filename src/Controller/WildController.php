<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\ProgramRepository;
use App\Repository\CategoryRepository;
use App\Repository\SeasonRepository;
use App\Repository\EpisodeRepository;
use App\Entity\Program;
use App\Entity\Episode;
use App\Entity\Category;
use App\Entity\Comment;
use App\Form\CommentType;
use App\Repository\CommentRepository;
use Symfony\Component\HttpFoundation\Request;
use App\Form\CategoryType;
use App\Service\Slugify;

class WildController extends AbstractController
{
    /**
    * @Route("/wild/{slug}", name="wild_show")
    */
    public function show(Program $program, Slugify $slugify)
    {
        $seasons = $program->getSeasons();
        $program->setSlug($slugify->generate($program->getTitle()));
        if (!$program) {
            throw $this
            ->createNotFoundException('No slug has been sent to find a program in program\'s table.');
        }

        return $this->render('wild/show.html.twig', [
            'program' => $program,
            'seasons' => $seasons,
        ]);
    }
   
    /**
     * @Route("/wild/category/{slug}", defaults={"slug" = null}, name="show_category")
     */
    public function showByCategory(Category $category, ProgramRepository $programRepository, Slugify $slugify)
    {
        $category->setSlug($slugify->generate($category->getName()));
        $programs = $programRepository->findBy(
          ['category' => $category],
          ['id' => 'DESC']
          
        );

        return $this->render('wild/category.html.twig', [
          'programs' => $programs,
          'category' => $category
        ]);
    }

   /**
     * @Route("/wild/program/{programName<[a-z0-9-]+>}", defaults={"programName" = null}, name="show_program")
     */
    public function showByProgram(string $programName, ProgramRepository $programRepository)
    {
        $program = $programRepository->findOneBy(['title' => str_replace('-', ' ',$programName)]);


        $seasons = $program->getSeasons();

        return $this->render('wild/program.html.twig', [
          'program' => $program,
          'seasons' => $seasons,
        ]);
    }

   /**
     * @Route("/wild/season/{seasonId<[0-9]+>}", defaults={"programName" = null}, name="show_season")
     */
    public function showBySeason(int $seasonId, SeasonRepository $seasonRepository)
    {
        $season = $seasonRepository->findOneById($seasonId);

        $program = $season->getProgram();
        $episodes = $season->getEpisodes();

        $hyphenizedTitles = [];
        foreach ($episodes as $episode) {
          $hyphenizedTitles[] = strtolower(str_replace(' ', '-', $episode->getTitle()));
        }

        return $this->render('wild/season.html.twig', [
          'program' => $program,
          'season' => $season,
          'episodes' => $episodes,
          'hyphenizedTitles' => $hyphenizedTitles
        ]);
    }
     
    /**
     * @Route("/wild/episode/{title}", name="show_episode")
     */
    public function showByEpisode(string $title, EpisodeRepository $episodeRepository, Request $request, CommentRepository $commentRepository)
    {
        $episode = $episodeRepository->findOneBy(['title' => ucwords(str_replace('-', ' ',$title))]);
        $season = $episode->getSeason();
        $program = $season->getProgram();
        $hyphenizedProgramTitle = strtolower(str_replace(' ', '-', $program->getTitle()));
        
        $comment = new Comment();
        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $comment->setAuthor($this->getUser());
            $comment->setEpisode($episode);
            $entityManager->persist($comment);
            $entityManager->flush();
        }
               
        return $this->render('wild/episode.html.twig', [
            'episode' => $episode,
            'season' => $season,
            'program' => $program,
            'hyphenizedProgramTitle' => $hyphenizedProgramTitle,
            'comments' => $commentRepository->findBy(['episode' => $episode]),
            'form' => $form->createView(),
            'user' => $this->getUser(),
        ]);
    }

}
