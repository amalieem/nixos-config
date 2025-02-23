final: prev: let
  inherit (prev) lib;

  wrapWithWaylandOzoneFlag = pkg: let
    binaryName = lib.removePrefix "${lib.getBin pkg}/bin/" (lib.getExe pkg);
  in pkg.overrideAttrs (prev': {
    postInstall = (prev'.postInstall or "") + ''
      wrapProgram "$out/bin/${binaryName}" \
        --add-flags "--enable-features=UseOzonePlatform --ozone-platform=wayland"
    '';
  });

  programList = [
    "element-desktop"
    #"chromium"
  ];
in
  lib.genAttrs programList (name: wrapWithWaylandOzoneFlag prev.${name})

