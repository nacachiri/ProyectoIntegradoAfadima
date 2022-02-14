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

    #[Route('/new', name: 'noticias_new', methods: ['POST'])]
    public function new(Request $request): JsonResponse
    {
        $imagen =$request->files->get('image');
        $dataPost = json_decode($request->getContent(), true);

        $imgUrl = uniqid().'.'.$imagen->getClientOriginalExtension();

        move_uploaded_file($imagen->getRealPath(), '../src/Imagenes/'.$imgUrl);

        $title = $dataPost['title'];
        $description = $dataPost['description'];
        $socioId = $dataPost['socioId'];
        
        if (empty($title) || empty($description) || empty($socioId)) {
            throw new NotFoundHttpException('Los parametros no son correctos');
        }

        $this->noticiasRepository->add($title, $description, $imgUrl, $socioId);

        return new JsonResponse(['status' => 'Noticia Creada correctamente'], Response::HTTP_CREATED);
    }

}
