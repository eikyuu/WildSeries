<?php
// src/Controller/WildController.php
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


use App\Repository\ProgramRepository;
use App\Entity\Program;

class DefaultController extends AbstractController
{
    /**
     * @Route("/", name="app_index")
    */
    public function index(ProgramRepository $programRepository)
    {
        $programs = $programRepository->findAll();

        if (!$programs) {
          throw $this->createNotFoundException('No program found in program\'s table.');
        }

        return $this->render('home/index.html.twig', ['programs' => $programs]);

    }
}
