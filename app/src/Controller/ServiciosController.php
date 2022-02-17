<?php

namespace App\Controller;

use App\Repository\ServiciosRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

#[Route('/api/servicios')]
class ServiciosController extends AbstractController
{

    public function __construct(ServiciosRepository $serviciosRepository)
    {
        $this->serviciosRepository = $serviciosRepository;
    }

    #[Route('/', name: 'servicios_index', methods: ['GET'])]
    public function index(): JsonResponse
    {
        return new JsonResponse($this->serviciosRepository->showAll(), Response::HTTP_OK);
    }

    #[Route('/{id}', name: 'servicios_id', methods: ['GET'])]
    public function showId($id): JsonResponse
    {
        return new JsonResponse($this->serviciosRepository->showId($id), Response::HTTP_OK);
    }

    #[Route('/new', name: 'servicios_new', methods: ['POST'])]
    public function new(Request $request): JsonResponse
    {
        $imagen =$request->files->get('image');
        $name = $request->request->get('name');
        $description = $request->request->get('description');
        $socioId = $request->request->get('socioId');

        $imgUrl = uniqid().'.'.$imagen->getClientOriginalExtension();

        move_uploaded_file($imagen->getRealPath(), 'Imagenes/servicios/'.$imgUrl);

        if (empty($name) || empty($description) || empty($socioId)) {
            throw new NotFoundHttpException('Los parametros no son correctos');
        }

        $this->serviciosRepository->add($name, $description, $imgUrl, $socioId);

        return new JsonResponse(['status' => 'Servicio Creado correctamente'], Response::HTTP_CREATED);
    }

    #[Route('/{servicioId}/edit', name: 'servicios_edit', methods: ['POST'])]
    public function edit($servicioId, Request $request): JsonResponse
    {
        $service = $this->serviciosRepository->findOneBy(['id' => $servicioId]);
        if ($service == null) {
            throw new NotFoundHttpException('Servicio no encotrado');
        }
        $imagen =$request->files->get('image');
        $name = $request->request->get('name');
        $description = $request->request->get('description');
        $socioId = $request->request->get('socioId');

        $this->serviciosRepository->edit($service, $imagen, $name, $description, $socioId);

        return new JsonResponse(['status' => 'Servicio Editado correctamente'], Response::HTTP_CREATED);
    }

    #[Route('/{servicioId}', name: 'servicios_delete', methods: ['DELETE'])]
    public function delete($servicioId): JsonResponse
    {
        $this->serviciosRepository->delete($servicioId);

        return new JsonResponse(['status' => 'Servicio Borrado correctamente'], Response::HTTP_OK);
    }
}
