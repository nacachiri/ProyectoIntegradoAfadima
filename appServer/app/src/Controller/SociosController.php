<?php

namespace App\Controller;

use App\Repository\SociosRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;


#[Route('/api/socios')]
class SociosController extends AbstractController
{
    public function __construct(SociosRepository $sociosRepository)
    {
        $this->sociosRepository = $sociosRepository;
    }

    #[Route('/', name: 'socios_index', methods: ['GET'])]
    public function index(): JsonResponse
    {
        return new JsonResponse($this->sociosRepository->showAll(), Response::HTTP_OK);
    }
}
