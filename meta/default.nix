{ pkgs, lib, config }: # Это делает файл функцией
let
    files = [
        ./lib
        
        ./directories.nix
        ./settings.nix
        ./apps.nix
    ];
    
    # Внутри импорта проверяем, является ли файл функцией
    importedFiles = map (path: 
        let 
            content = import path;
        in 
            if builtins.isFunction content 
            then content { inherit pkgs lib config; } 
            else content
    ) files;
in
    lib.foldl' lib.recursiveUpdate {} importedFiles