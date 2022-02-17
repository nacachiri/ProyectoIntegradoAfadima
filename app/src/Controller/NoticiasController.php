<?php

namespace App\Controller;

use App\Repository\NoticiasRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

#[Route('/api/noticias')]
class NoticiasController extends AbstractController
{

    public function __construct(NoticiasRepository $noticiasRepository)
    {
        $this->noticiasRepository = $noticiasRepository;
    }

    #[Route('/', name: 'noticias_index', methods: ['GET'])]
    public function index(): JsonResponse
    {
        return new JsonResponse($this->noticiasRepository->showAll(), Response::HTTP_OK);
    }

    
    #[Route('/{id}', name: 'noticias_id', methods: ['GET'])]
    public function showId($id): JsonResponse
    {
        return new JsonResponse($this->noticiasRepository->showId($id), Response::HTTP_OK);
    }

    #[Route('/new', name: 'noticias_new', methods: ['POST'])]
    public function new(Request $request): JsonResponse
    {
        $imagen =$request->files->get('image');
        $title = $request->request->get('title');
        $description = $request->request->get('description');
        $socioId = $request->request->get('socioId');

        var_dump($imagen);

        $imgUrl = uniqid().'.'.$imagen->getClientOriginalExtension();

        var_dump($imgUrl);

        var_dump($imagen->getClientOriginalExtension());
        var_dump($imagen->getRealPath());

        move_uploaded_file($imagen->getRealPath(), 'Imagenes/noticias/'.$imgUrl);

        if (empty($title) || empty($description) || empty($socioId)) {
            throw new NotFoundHttpException('Los parametros no son correctos');
        }

        $this->noticiasRepository->add($title, $description, $imgUrl, $socioId);

        return new JsonResponse(['status' => 'Noticia Creada correctamente'], Response::HTTP_CREATED);
    }

    #[Route('/{noticiaId}/edit', name: 'noticias_edit', methods: ['POST'])]
    public function edit($noticiaId, Request $request): JsonResponse
    {
        $noticia = $this->noticiasRepository->findOneBy(['id' => $noticiaId]);
        if ($noticia == null) {
            throw new NotFoundHttpException('Noticia no encotrada');
        }
        $imagen =$request->files->get('image');
        $title = $request->request->get('title');
        $description = $request->request->get('description');
        $socioId = $request->request->get('socioId');

        $this->noticiasRepository->edit($noticia, $imagen, $title, $description, $socioId);

        return new JsonResponse(['status' => 'Noticia Editada correctamente'], Response::HTTP_CREATED);
    }

    #[Route('/{noticiaId}', name: 'noticias_delete', methods: ['DELETE'])]
    public function delete($noticiaId): JsonResponse
    {
        $this->noticiasRepository->delete($noticiaId);

        return new JsonResponse(['status' => 'Noticia Borrado correctamente'], Response::HTTP_OK);
    }
    
}
