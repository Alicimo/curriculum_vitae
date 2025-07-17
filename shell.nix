with import <nixpkgs> { };

mkShell {
  buildInputs = [ (texlive.combine {
                    inherit (texlive)
                      scheme-small

                      # Add other LaTeX libraries (packages) here as needed, e.g:
                      titlesec
                      marvosym

                      # build tools
                      latexmk
                      ;
                  })
                  glibcLocales
                ];
}