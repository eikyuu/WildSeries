<?php

namespace App\Form;

use App\Entity\Actor;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use App\Entity\Program;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ProgramType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title')
            ->add('poster')
            ->add('country')
            ->add('year')
            ->add('synopsis')
            ->add('category', null, ['choice_label' => 'name']);
            
        $builder->add('actors', EntityType::class, [
            'class' => Actor::class,
            'choice_label' => 'name',
            'multiple' => true,
            'expanded' => true,
        ]);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Program::class,
            'attr' => [
                'novalidate' => 'novalidate',
            ]
        ]);
    }
}
