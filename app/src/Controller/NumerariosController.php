<?php

namespace App\Controller;

use App\Repository\NumerariosRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

#[Route('/api/numerarios')]
class NumerariosController extends AbstractController
{
    public function __construct(NumerariosRepository $numerariosRepository)
    {
        $this->numerariosRepository = $numerariosRepository;
    }

    #[Route('/', name: 'numerarios_index', methods: ['GET'])]
    public function index(): JsonResponse
    {
        return new JsonResponse($this->numerariosRepository->showAll(), Response::HTTP_OK);
    }
}
