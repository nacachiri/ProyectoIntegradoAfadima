<?php

namespace App\Repository;

use App\Entity\{Servicios, Socios};
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

/**
 * @method Servicios|null find($id, $lockMode = null, $lockVersion = null)
 * @method Servicios|null findOneBy(array $criteria, array $orderBy = null)
 * @method Servicios[]    findAll()
 * @method Servicios[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ServiciosRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, Servicios::class);
        $this->manager = $entityManager;
    }

    public function showAll()
    {
        $services = $this->findAll();

        if ($services == null) {
            throw new NotFoundHttpException('No hay Servicios');
        }

        foreach ($services as $service) {

            $data[] = [

                'id' => $service->getId(),
                'name' => $service->getName(),
                'description' => $service->getDescription(),
                'imgUrl' => 'Imagenes/servicios/'.$service->getImgUrl(),
                'socioId' => $service->getSocioId()->getName(),

            ];

        }

        return $data;
    }

    public function showId($id)
    {
        $service = $this->findOneBy(['id' => $id]);

        if ($service == null) {
            throw new NotFoundHttpException('No hay Service');
        }

        $data = [

            'id' => $service->getId(),
            'name' => $service->getName(),
            'description' => $service->getDescription(),
            'imgUrl' => 'Imagenes/servicios/'.$service->getImgUrl(),
            'socioId' => $service->getSocioId()->getName(),

        ];

        return $data;
    }

    public function add($name, $description, $imgUrl, $socioId)
    {
        $service = new Servicios();

        $service
            ->setName($name)
            ->setDescription($description)
            ->setImgUrl($imgUrl)
            ->setSocioId($this->manager->getRepository(Socios::class)->findOneBy(['id' => $socioId]));

        $this->manager->persist($service);
        $this->manager->flush();

    }

    public function edit(Servicios $service, $imagen, $name, $description, $socioId): Servicios
    {
        empty($name) ? true : $service->setName($name);
        empty($description) ? true : $service->setDescription($description);
        empty($socioId) ? true : $service->setNumerarioId($this->manager->getRepository(Numerarios::class)->findOneBy(['id' => $socioId]));
        empty($imagen) ? true : move_uploaded_file($imagen->getRealPath(), 'Imagenes/servicios/'.$service->getImgUrl());

        $this->manager->persist($service);
        $this->manager->flush();

        return $service;
    }

    public function delete($serviceId)
    {
        $service = $this->findOneBy(['id' => $serviceId]);

        if ($service == null) {
            throw new NotFoundHttpException('Servicio no encotrado');
        }
        
        unlink('Imagenes/servicios/'.$service->getImgUrl());
        $this->manager->remove($service);
        $this->manager->flush();
    }


    // /**
    //  * @return Servicios[] Returns an array of Servicios objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('s.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Servicios
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
