<?php

// This file has been auto-generated by the Symfony Dependency Injection Component for internal use.

if (\class_exists(\ContainerLbK27JW\srcApp_KernelDevDebugContainer::class, false)) {
    // no-op
} elseif (!include __DIR__.'/ContainerLbK27JW/srcApp_KernelDevDebugContainer.php') {
    touch(__DIR__.'/ContainerLbK27JW.legacy');

    return;
}

if (!\class_exists(srcApp_KernelDevDebugContainer::class, false)) {
    \class_alias(\ContainerLbK27JW\srcApp_KernelDevDebugContainer::class, srcApp_KernelDevDebugContainer::class, false);
}

return new \ContainerLbK27JW\srcApp_KernelDevDebugContainer([
    'container.build_hash' => 'LbK27JW',
    'container.build_id' => 'a7cf0989',
    'container.build_time' => 1575301753,
], __DIR__.\DIRECTORY_SEPARATOR.'ContainerLbK27JW');
