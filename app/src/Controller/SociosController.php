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

    #[Route('/{id}', name: 'socios_id', methods: ['GET'])]
    public function showId($id): JsonResponse
    {
        return new JsonResponse($this->sociosRepository->showId($id), Response::HTTP_OK);
    }

    #[Route('/new', name: 'socios_new', methods: ['POST'])]
    public function new(Request $request): JsonResponse
    {
        $dataPost = json_decode($request->getContent(), true);

        $email = $dataPost['email'];
        $password = $dataPost['password'];
        $rol = $dataPost['rol'];
        $name = $dataPost['name'];
        $surnames = $dataPost['surnames'];
        $address = $dataPost['address'];
        $phone = $dataPost['phone'];
        $numerarioId = ($dataPost['numerarioId']) ? $dataPost['numerarioId'] : null;

        $this->sociosRepository->add($email, $password, $rol, $name, $surnames, $address, $phone, $numerarioId);

        return new JsonResponse(['status' => 'Socio Creado correctamente'], Response::HTTP_CREATED);
    }

    #[Route('/{socioId}/edit', name: 'socios_edit', methods: ['PUT'])]
    public function edit($socioId, Request $request): JsonResponse
    {
        $dataPost = json_decode($request->getContent(), true);
        $socio = $this->sociosRepository->findOneBy(['id' => $socioId]);

        if ($socio == null) {
            throw new NotFoundHttpException('Socio no encotrado');
        }

        $email = $dataPost['email'];
        $password = $dataPost['password'];
        $rol = $dataPost['rol'];
        $name = $dataPost['name'];
        $surnames = $dataPost['surnames'];
        $address = $dataPost['address'];
        $phone = $dataPost['phone'];
        $numerarioId = $dataPost['numerarioId'];

        $this->sociosRepository->edit($socio, $email, $password, $rol, $name, $surnames, $address, $phone, $numerarioId);

        return new JsonResponse(['status' => 'Socio Editado correctamente'], Response::HTTP_OK);
    }

    #[Route('/{socioId}', name: 'socios_delete', methods: ['DELETE'])]
    public function delete($socioId): JsonResponse
    {
        $socio = $this->sociosRepository->findOneBy(['id' => $socioId]);

        if ($socio == null) {
            throw new NotFoundHttpException('Socio no encotrado');
        }

        $this->sociosRepository->delete($socio);

        return new JsonResponse(['status' => 'Socio Borrado correctamente'], Response::HTTP_OK);
    }

    #[Route('/email/{email}', name: 'socios_email', methods: ['GET'])]
    public function emailId($email): JsonResponse
    {
        $socio = $this->sociosRepository->findOneBy(['email' => $email]);

        if ($socio == null) {
            throw new NotFoundHttpException('Socio no encotrado');
        }

        return new JsonResponse(['id' => $socio->getId()], Response::HTTP_OK);
    }
}
