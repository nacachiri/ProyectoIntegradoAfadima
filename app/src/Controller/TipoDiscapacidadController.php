<?php

namespace App\Controller;

use App\Repository\TipoDiscapacidadRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

#[Route('/api/tipoDiscapacidad')]
class TipoDiscapacidadController extends AbstractController
{
    public function __construct(TipoDiscapacidadRepository $tipoDiscapacidadRepository)
    {
        $this->tipoDiscapacidadRepository = $tipoDiscapacidadRepository;
    }

    #[Route('/', name: 'tipoDiscapacidad_index', methods: ['GET'])]
    public function index(): JsonResponse
    {
        return new JsonResponse($this->tipoDiscapacidadRepository->showAll(), Response::HTTP_OK);
    }

    #[Route('/new', name: 'tipoDiscapacidad_new', methods: ['POST'])]
    public function new(Request $request): JsonResponse
    {
        $dataPost = json_decode($request->getContent(), true);

        $name = $dataPost['name'];
        
        if (empty($name)) {
            throw new NotFoundHttpException('Los parametros no son correctos');
        }

        $this->tipoDiscapacidadRepository->add($name);

        return new JsonResponse(['status' => 'TipoDiscapacidad Creado correctamente'], Response::HTTP_CREATED);
    }

    #[Route('/{tipoDiscapacidadId}/edit', name: 'tipoDiscapacidad_edit', methods: ['PUT'])]
    public function edit($tipoDiscapacidadId, Request $request): JsonResponse
    {
        $dataPost = json_decode($request->getContent(), true);
        $tipoDiscapacidad = $this->tipoDiscapacidadRepository->findOneBy(['typeId' => $tipoDiscapacidadId]);

        $name = $dataPost['name'];
        
        if (empty($name)) {
            throw new NotFoundHttpException('Los parametros no son correctos');
        }

        $this->tipoDiscapacidadRepository->edit($tipoDiscapacidad, $name);

        return new JsonResponse(['status' => 'TipoDiscapacidad Editado correctamente'], Response::HTTP_CREATED);
    }

    #[Route('/{tipoDiscapacidadId}', name: 'tipoDiscapacidad_delete', methods: ['DELETE'])]
    public function delete($tipoDiscapacidadId): JsonResponse
    {
        $tipoDiscapacidad = $this->tipoDiscapacidadRepository->findOneBy(['typeId' => $tipoDiscapacidadId]);

        $this->tipoDiscapacidadRepository->delete($tipoDiscapacidad);

        return new JsonResponse(['status' => 'TipoDiscapacidad Borrado correctamente'], Response::HTTP_OK);
    }
}