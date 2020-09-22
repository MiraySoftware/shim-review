This repo is for review of requests for signing shim.  To create a request for review:

- clone this repo
- edit the template below
- add the shim.efi to be signed
- add build logs
- add any additional binaries/certificates/SHA256 hashes that may be needed
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push that to github
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your branch
- approval is ready when you have accepted tag

Note that we really only have experience with using GRUB2 on Linux, so asking
us to endorse anything else for signing is going to require some convincing on
your part.

Here's the template:

-------------------------------------------------------------------------------
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------

We are the Miray Software AG, producers of microkernel OS "Symobi" and the
widely known Stand-Alone-Tools "HDClone" and "HDShredder" as well as other
hardware related tools, running without an installed operating system.
https://www.miray-software.com/

-------------------------------------------------------------------------------
What product or service is this for:
-------------------------------------------------------------------------------

The product is a Self-Booting system (typically from a USB flash drive or a CD,
containing one of our Stand-Alone-Tools, based on either our own microkernel
OS "Symobi" or a Linux kernel with our application framework on top.
A similar version, which runs as a normal Windows application, also exists, but
isn’t actually considered to be "Stand-Alone", as it requires an existing
Windows installation and is limited in several aspects that require direct
hardware access.

We have used a Microsoft SecureBoot signed Shim since 2014 and the focus and
requirements of our products have not changed since then.

-------------------------------------------------------------------------------
What's the justification that this really does need to be signed for the whole world to be able to boot it:
-------------------------------------------------------------------------------

We make software tools for Data Cloning, Backup/Recovery and Secure Deletion,
as well as other specialized tools for computer technicians, companies and
industrial use. Our tools are well known and used worldwide in more than 160
countries. Many of the tasks our software performs requires direct hardware 
acces and is usually not possible to perform under a Windows environment.
Especially restoring system backups, deployment of master images, data rescue
and forensic imaging requires our software to boot directly on SecureBoot systems.

-------------------------------------------------------------------------------
Who is the primary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Alexander Roalter
- Position: Head of Development 
- Email address: <ar@miray.de>
- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the Linux community:
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v2

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
0sgEV9sfQxI=
=O7Zm
-----END PGP PUBLIC KEY BLOCK-----


-------------------------------------------------------------------------------
Who is the secondary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Thomas Frauendorfer
- Position: Shim, Grub & Linux Buildroot Development
- Email address: <tf@miray.de>
- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the Linux community:
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v2

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
QA==
=biUp
-----END PGP PUBLIC KEY BLOCK-----
>>>>>>> Miray 20210323

-------------------------------------------------------------------------------
Please create your shim binaries starting with the 15.4 shim release tar file:
https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.4 and contains
the appropriate gnu-efi source.
-------------------------------------------------------------------------------

Our tree is based on https://github.com/rhboot/shim/tree/shim-15.4 which includes
https://github.com/rhboot/shim/releases/tag/15.4

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------

Source code is located at https://github.com/MiraySoftware/shim/tree/miray-15.4-1

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------

+ shim-15.4 branch: update .gitmodules to point at shim-15.4 in gnu-efi

  Added in upstream shim-15.4 branch

+ Don't call QueryVariableInfo() on EFI 1.10 machines

  Cherry picked from upstream master to fix boot problems on Apple Mac systems


+ mok: allocate MOK config table as BootServicesData

  Cherry picked from upstream master to fix warning when booting linux


+ Remove command line handling

  Custom patch to remove EFI command line handling and only start the default  boot loader
  
  We have been getting error reports from users that seem to be caused by the command line 
  handling code in shim. Because we only use shim to load GRUB be decided to remove the 
  command line handling and only start the default boot loader.

-------------------------------------------------------------------------------
If bootloader, shim loading is, GRUB2: is CVE-2020-14372, CVE-2020-25632,
 CVE-2020-25647, CVE-2020-27749, CVE-2020-27779, CVE-2021-20225, CVE-2021-20233,
 CVE-2020-10713, CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311,
 CVE-2020-15705, and if you are shipping the shim_lock module CVE-2021-3418
-------------------------------------------------------------------------------

Yes, all included.

Grub is branched from 2.06-rc1

-------------------------------------------------------------------------------
What exact implementation of Secureboot in GRUB2 ( if this is your bootloader ) you have ?
* Upstream GRUB2 shim_lock verifier or * Downstream RHEL/Fedora/Debian/Canonical like implementation ?
-------------------------------------------------------------------------------

We use upstream grub2 lockdown + shim_lock verifier. 

We also pull patches from Fedora for the linux loader, but the verification code
of those patches will only get used if secureboot is active but lockdown is not.
(To our knowledge this should never happen.)

We disable most loaders as it is done in the Fedora downstream code.


-------------------------------------------------------------------------------
If bootloader, shim loading is, GRUB2, and previous shims were trusting affected
by CVE-2020-14372, CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
  CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
  CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
  and if you were shipping the shim_lock module CVE-2021-3418
  ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
  grub2:
* were old shims hashes provided to Microsoft for verification
  and to be added to future DBX update ?
* Does your new chain of trust disallow booting old, affected by CVE-2020-14372,
  CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
  CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
  CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
  and if you were shipping the shim_lock module CVE-2021-3418
  ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
  grub2 builds ?
-------------------------------------------------------------------------------

* were old shims hashes provided to Microsoft for verification
  and to be added to future DBX update:

Hashes for SHIMs signed before July 2020 provided through keybase
No SHIM signed Between July 2020 and February 2021

Shim 15.3 has not been distributed.

* Does your new chain of trust disallow booting old, affected by CVE-2020-14372,
  CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
  CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
  CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
  and if you were shipping the shim_lock module CVE-2021-3418
  ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
  grub2 builds ?

July 2020 grub2 CVE list:
New shim uses a new certificate that has not signed any Grub vulnerable to July
2020 grub2 CVE list. Previous certificate is not included.

March 2021 grub2 CVE list:
Shim checks vor SBAT section. No vulnerable Grub contains a SBAT section. 
Additionally: Grub versions that might be vulnerable to March 2021 grub2 CVE
list deny-listed through VENDOR_DBX. Chainloader module is disabled, so Grub
cannot be used to circumvent SBAT checks in Shim.


-------------------------------------------------------------------------------
If your boot chain of trust includes linux kernel, is
"efi: Restrict efivar_ssdt_load when the kernel is locked down"
upstream commit 1957a85b0032a81e6482ca4aab883643b8dae06e applied ?
Is "ACPI: configfs: Disallow loading ACPI tables when locked down"
upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 applied ?
-------------------------------------------------------------------------------

Yes, we currently use linux lts kernel 5.10.14:

1957a85b0032a81e6482ca4aab883643b8dae06e is included since upstream linux version 5.4.0

75b0cea7bf307f362057cc778efe89af4c615354 was merged to upstream linux version 5.7.7

-------------------------------------------------------------------------------
If you use vendor_db functionality of providing multiple certificates and/or
hashes please briefly describe your certificate setup. If there are allow-listed hashes
please provide exact binaries for which hashes are created via file sharing service,
available in public with anonymous access for verification
-------------------------------------------------------------------------------

Not used, no binaries allow-listed

-------------------------------------------------------------------------------
If you are re-using a previously used (CA) certificate, you will need
to add the hashes of the previous GRUB2 binaries to vendor_dbx in shim
in order to prevent GRUB2 from being able to chainload those older GRUB2
binaries. If you are changing to a new (CA) certificate, this does not
apply. Please describe your strategy.
-------------------------------------------------------------------------------

We switched to a new certificate in 2020, no grub vulnerable to the 
July 2020 grub2 CVE list was signed with that certificate.

Grub versions that might be vulnerable to the March 2021 grub2 CVE list are 
included in the vendor_dbx list.

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
If the shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case and the differences would be.
-------------------------------------------------------------------------------

We use Debian Buster on x86_64 as build environment for shim.

You can use the Dockerfile to verify the build.

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------

The file 'build.log' holds the complete build run, starting with cleanup of old
files, checkout, build and packaging the built file into a .cab file.

-------------------------------------------------------------------------------
Add any additional information you think we may need to validate this shim
-------------------------------------------------------------------------------

sha256 hash: bb84f1bb5b1ffd1542af322663dd5a092ae40458f6e3a97537cf974f2cd59e2e

