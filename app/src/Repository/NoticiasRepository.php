<?php

namespace App\Repository;

use App\Entity\{Noticias, Socios};
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

/**
 * @method Noticias|null find($id, $lockMode = null, $lockVersion = null)
 * @method Noticias|null findOneBy(array $criteria, array $orderBy = null)
 * @method Noticias[]    findAll()
 * @method Noticias[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class NoticiasRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry, EntityManagerInterface $entityManager)
    {
        parent::__construct($registry, Noticias::class);
        $this->manager = $entityManager;
    }

    public function showAll()
    {
        $noticias = $this->findAll();

        foreach ($noticias as $noticia) {

            $data[] = [

                'id' => $noticia->getId(),
                'title' => $noticia->getTitle(),
                'description' => $noticia->getDescription(),
                'imgUrl' => 'Imagenes/noticias/'.$noticia->getImgUrl(),
                'socioId' => $noticia->getSocioId()->getName(),

            ];

        }

        return $data;
    }

    public function showId($id)
    {
        $noticia = $this->findOneBy(['id' => $id]);

        $data = [

            'id' => $noticia->getId(),
            'title' => $noticia->getTitle(),
            'description' => $noticia->getDescription(),
            'imgUrl' => 'Imagenes/noticias/'.$noticia->getImgUrl(),
            'socioId' => $noticia->getSocioId()->getName(),

        ];

        return $data;
    }

    public function add($title, $description, $imgUrl, $socioId)
    {
        $noticia = new Noticias();

        $noticia
            ->setTitle($title)
            ->setDescription($description)
            ->setImgUrl($imgUrl)
            ->setSocioId($this->manager->getRepository(Socios::class)->findOneBy(['id' => $socioId]));

        $this->manager->persist($noticia);
        $this->manager->flush();

    }

    public function edit(Noticias $noticia, $imagen, $title, $description, $socioId): Noticias
    {
        empty($title) ? true : $noticia->setTitle($title);
        empty($description) ? true : $noticia->setDescription($description);
        empty($socioId) ? true : $noticia->setSocioId($this->manager->getRepository(Socios::class)->findOneBy(['id' => $socioId]));
        empty($imagen) ? true : move_uploaded_file($imagen->getRealPath(), 'Imagenes/noticias/'.$noticia->getImgUrl());

        $this->manager->persist($noticia);
        $this->manager->flush();

        return $noticia;
    }

    public function delete($noticiaId)
    {
        $noticia = $this->findOneBy(['id' => $noticiaId]);

        if ($noticia == null) {
            throw new NotFoundHttpException('Noticia no encotrada');
        }
        
        unlink('Imagenes/noticias/'.$noticia->getImgUrl());
        $this->manager->remove($noticia);
        $this->manager->flush();
    }

    

    // /**
    //  * @return Noticias[] Returns an array of Noticias objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('n')
            ->andWhere('n.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('n.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Noticias
    {
        return $this->createQueryBuilder('n')
            ->andWhere('n.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
