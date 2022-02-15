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

    #[Route('/{socioId}/new', name: 'numerarios_new', methods: ['POST'])]
    public function new($socioId, Request $request): JsonResponse
    {
        $dataPost = json_decode($request->getContent(), true);

        $name = $dataPost['name'];
        $dni = $dataPost['dni'];
        $birthDate = $dataPost['birthDate'];
        $typeDisc = $dataPost['typeDisc'];
        
        if (empty($socioId) || empty($name) || empty($dni) || empty($birthDate) || empty($typeDisc)) {
            throw new NotFoundHttpException('Los parametros no son correctos');
        }

        $this->numerariosRepository->add($socioId, $name, $dni, $birthDate, $typeDisc);

        return new JsonResponse(['status' => 'Numerarios Creado correctamente'], Response::HTTP_CREATED);
    }

    #[Route('/{numerarioId}/edit', name: 'numerarios_edit', methods: ['PUT'])]
    public function edit($numerarioId, Request $request): JsonResponse
    {
        $dataPost = json_decode($request->getContent(), true);
        $numerario = $this->numerariosRepository->findOneBy(['id' => $numerarioId]);

        if ($numerario == null) {
            throw new NotFoundHttpException('Numerario no encotrado');
        }

        $name = $dataPost['name'];
        $dni = $dataPost['dni'];
        $birthDate = $dataPost['birthDate'];
        $typeDisc = $dataPost['typeDisc'];
        
        if (empty($numerario) || empty($name) || empty($dni) || empty($birthDate) || empty($typeDisc)) {
            throw new NotFoundHttpException('Los parametros no son correctos');
        }

        $this->numerariosRepository->edit($numerario, $name, $dni, $birthDate, $typeDisc);

        return new JsonResponse(['status' => 'Numerarios Editado correctamente'], Response::HTTP_CREATED);
    }

    #[Route('/{numerarioId}', name: 'numerarios_delete', methods: ['DELETE'])]
    public function delete($numerarioId): JsonResponse
    {
        $numerario = $this->numerariosRepository->findOneBy(['id' => $numerarioId]);

        if ($numerario == null) {
            throw new NotFoundHttpException('Numerario no encotrado');
        }

        $this->numerariosRepository->delete($numerario);

        return new JsonResponse(['status' => 'Nunerarios Borrado correctamente'], Response::HTTP_OK);
    }
}
