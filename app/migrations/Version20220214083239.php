<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220214083239 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE noticias (id INT AUTO_INCREMENT NOT NULL, title VARCHAR(255) NOT NULL, description LONGTEXT NOT NULL, img_url VARCHAR(255) NOT NULL, socioId INT NOT NULL, INDEX IDX_253D92591DC043 (socioId), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE numerarios (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(100) NOT NULL, dni VARCHAR(10) NOT NULL, birthDate DATE NOT NULL, typeDisc INT NOT NULL, INDEX IDX_4B113166EDE10515 (typeDisc), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE productos (id INT AUTO_INCREMENT NOT NULL, numerario_id_id INT DEFAULT NULL, name VARCHAR(255) NOT NULL, description LONGTEXT NOT NULL, img_url VARCHAR(255) NOT NULL, INDEX IDX_767490E65FA619BA (numerario_id_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE servicios (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, description LONGTEXT NOT NULL, img_url VARCHAR(255) NOT NULL, socioId INT NOT NULL, INDEX IDX_C07E802F91DC043 (socioId), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE socios (id INT AUTO_INCREMENT NOT NULL, email VARCHAR(255) NOT NULL, password VARCHAR(255) NOT NULL, rol JSON NOT NULL, name VARCHAR(50) NOT NULL, surnames VARCHAR(100) NOT NULL, address VARCHAR(255) NOT NULL, phone INT NOT NULL, numerarioId INT NOT NULL, UNIQUE INDEX UNIQ_62EAC1FCE7927C74 (email), UNIQUE INDEX UNIQ_62EAC1FC19EE41E9 (numerarioId), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tipo_discapacidad (typeId INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY(typeId)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE noticias ADD CONSTRAINT FK_253D92591DC043 FOREIGN KEY (socioId) REFERENCES socios (id)');
        $this->addSql('ALTER TABLE numerarios ADD CONSTRAINT FK_4B113166EDE10515 FOREIGN KEY (typeDisc) REFERENCES tipo_discapacidad (typeId)');
        $this->addSql('ALTER TABLE productos ADD CONSTRAINT FK_767490E65FA619BA FOREIGN KEY (numerario_id_id) REFERENCES numerarios (id)');
        $this->addSql('ALTER TABLE servicios ADD CONSTRAINT FK_C07E802F91DC043 FOREIGN KEY (socioId) REFERENCES socios (id)');
        $this->addSql('ALTER TABLE socios ADD CONSTRAINT FK_62EAC1FC19EE41E9 FOREIGN KEY (numerarioId) REFERENCES numerarios (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE productos DROP FOREIGN KEY FK_767490E65FA619BA');
        $this->addSql('ALTER TABLE socios DROP FOREIGN KEY FK_62EAC1FC19EE41E9');
        $this->addSql('ALTER TABLE noticias DROP FOREIGN KEY FK_253D92591DC043');
        $this->addSql('ALTER TABLE servicios DROP FOREIGN KEY FK_C07E802F91DC043');
        $this->addSql('ALTER TABLE numerarios DROP FOREIGN KEY FK_4B113166EDE10515');
        $this->addSql('DROP TABLE noticias');
        $this->addSql('DROP TABLE numerarios');
        $this->addSql('DROP TABLE productos');
        $this->addSql('DROP TABLE servicios');
        $this->addSql('DROP TABLE socios');
        $this->addSql('DROP TABLE tipo_discapacidad');
    }
}
