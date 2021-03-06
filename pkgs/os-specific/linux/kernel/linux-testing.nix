{ stdenv, buildPackages, fetchurl, perl, buildLinux, libelf, utillinux, ... } @ args:

buildLinux (args // rec {
  version = "4.20-rc6";
  modDirVersion = "4.20.0-rc6";
  extraMeta.branch = "4.20";

  src = fetchurl {
    url = "https://git.kernel.org/torvalds/t/linux-${version}.tar.gz";
    sha256 = "1hmcwlf3lcim4z265pqz6v4na6072xcqzrnq57wacznmg31m7y0c";
  };

  # Should the testing kernels ever be built on Hydra?
  extraMeta.hydraPlatforms = [];

} // (args.argsOverride or {}))
