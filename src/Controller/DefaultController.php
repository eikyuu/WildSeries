<?php

namespace App\Controller;
use App\Entity\Program;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

Class DefaultController extends AbstractController
{
    /**
     * @Route("/", name="app_index")
    */
    public function index() :Response
    {
        return $this->render('wild/home.html.twig', [
                'website' => 'Bienvenue sur Wild Séries',
        ]);
    }
}