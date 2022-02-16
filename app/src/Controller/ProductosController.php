<?php

namespace App\Controller;

use App\Repository\ProductosRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class ProductosController extends AbstractController
{
    public function __construct(ProductosRepository $productosRepository)
    {
        $this->productosRepository = $productosRepository;
    }

    #[Route('/', name: 'productos_index', methods: ['GET'])]
    public function index(): JsonResponse
    {
        return new JsonResponse($this->productosRepository->showAll(), Response::HTTP_OK);
    }

    #[Route('/{id}', name: 'productos_id', methods: ['GET'])]
    public function showId($id): JsonResponse
    {
        return new JsonResponse($this->productosRepository->showId($id), Response::HTTP_OK);
    }

    #[Route('/new', name: 'productos_new', methods: ['POST'])]
    public function new(Request $request): JsonResponse
    {
        $imagen =$request->files->get('image');
        $name = $request->request->get('name');
        $description = $request->request->get('description');
        $numerarioId = $request->request->get('numerarioId');

        $imgUrl = uniqid().'.'.$imagen->getClientOriginalExtension();

        move_uploaded_file($imagen->getRealPath(), 'Imagenes/productos/'.$imgUrl);

        if (empty($name) || empty($description) || empty($numerarioId)) {
            throw new NotFoundHttpException('Los parametros no son correctos');
        }

        $this->productosRepository->add($name, $description, $imgUrl, $numerarioId);

        return new JsonResponse(['status' => 'Producto Creada correctamente'], Response::HTTP_CREATED);
    }

    #[Route('/{productoId}/edit', name: '', methods: ['POST'])]
    public function edit($productoId, Request $request): JsonResponse
    {
        $producto = $this->productosRepository->findOneBy(['id' => $productoId]);
        if ($producto == null) {
            throw new NotFoundHttpException('Producto no encotrada');
        }
        $imagen =$request->files->get('image');
        $name = $request->request->get('name');
        $description = $request->request->get('description');
        $numerarioId = $request->request->get('numerarioId');

        $this->productosRepository->edit($producto, $imagen, $name, $description, $numerarioId);

        return new JsonResponse(['status' => 'Producto Editada correctamente'], Response::HTTP_CREATED);
    }

    #[Route('/{productoId}', name: 'productos_delete', methods: ['DELETE'])]
    public function delete($productoId): JsonResponse
    {
        $this->productosRepository->delete($productoId);

        return new JsonResponse(['status' => 'Producto Borrado correctamente'], Response::HTTP_OK);
    }


}
