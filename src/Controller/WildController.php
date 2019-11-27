<?php
// src/Controller/WildController.php
namespace App\Controller;
use App\Entity\Program;
use App\Entity\Category;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
    /**
     * @Route("/wild", name="wild_")
    */
Class WildController extends AbstractController
{
      /**
     * Show all rows from Program’s entity
     *
     * @Route("/", name="wild_index")
     * @return Response A response instance
     */
    public function index(): Response
    {
         $programs = $this->getDoctrine()
             ->getRepository(Program::class)
             ->findAll();
    
         if (!$programs) {
             throw $this->createNotFoundException(
             'No program found in program\'s table.'
             );
         }
    
         return $this->render(
                 'wild/index.html.twig',
                 ['programs' => $programs]
         );
    }

    /**
    * Getting a program with a formatted slug for title
    *
    * @param string $slug The slugger
    * @Route("/show/{slug<^[a-z0-9-]+$>}", defaults={"slug" = null}, name="show")
    * @return Response
    */
    public function show(?string $slug):Response
    {
        if (!$slug) {
            throw $this
                ->createNotFoundException('No slug has been sent to find a program in program\'s table.');
        }
        $slug = preg_replace(
            '/-/',
            ' ', ucwords(trim(strip_tags($slug)), "-")
        );
        $program = $this->getDoctrine()
            ->getRepository(Program::class)
            ->findOneBy(['title' => mb_strtolower($slug)]);
        if (!$program) {
            throw $this->createNotFoundException(
                'No program with '.$slug.' title, found in program\'s table.'
            );
        }

        return $this->render('wild/show.html.twig', [
            'program' => $program,
            'slug'  => $slug,
        ]);
    }
    /**
    * @Route("/category/{category<^[a-z0-9-]+$>}", defaults={"category" = null}, name="show_category")
    */
    public function showByCategory(string $category) : Response 
    {
        if (!$category) {
            throw $this
                ->createNotFoundException('No category has been sent to find a category.');
        }
        $category = preg_replace(
            '/-/',
            ' ', ucwords(trim(strip_tags($category)), "-")
        );
        $category = $this->getDoctrine()
            ->getRepository(Category::class)
            ->findBy(
                ['name' => $category]
            );
        $program = $this->getDoctrine()
            ->getRepository(Program::class)
            ->findBy(
                ["category" => $category],
                ["id" => "DESC"],
                3
            );
        return $this->render('wild/category.html.twig', [
            'category' => $category,
            'programs' => $program
        ]);
    }
}