# README

## Tabla de Contenidos

- [README](#readme)
  - [Tabla de Contenidos](#tabla-de-contenidos)
  - [Dependencias](#dependencias)
  - [Comandos](#comandos)

## Dependencias

> **⚠ Advertencia**  
> Creo que no estan todas las dependencias en la lista si hay alguna que no este, me avisan.  

- **Ruby**, comprobar con `Ruby -v` .

    ```bash
    $ ruby -v
      ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-linux-gnu]
    ```

- **Rails**, comprobar con `Rails -v` .

    ```bash
    $ rails -v
      Rails 6.1.0 
    ```

- **Yarn**, comprobar con `Yarn -v` .  
  
  ```bash
  $ yarn -v
    1.22.5 
    ```

## Comandos

  > **📝 Nota**  
> Comandos para instalar todas las dependencias necesarias para iniciar el proyecto.

1. Primero debemos instalar las dependencias del proyecto:

    ```bash
    bundle
    ```

2. Luego debemos instalar las dependencias de `Yarn` :  

    ```bash
    yarn install
    ```

3. Verificamos que todo este correcto corriendo `Rails s` :

    ```bash
    rails s
    ```

Si sale todo bien en `localhost:3000` debe salir algo pareciedo a esto.  

![test](https://i.imgur.com/nGIH52W.png)
