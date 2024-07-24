with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "mydoc";
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
  src = ./.;
  buildPhase = "make";

  meta = with lib; {
    description = "Describe your document here";
    license = licenses.bsd3;
    platforms = platforms.linux;
  };
}