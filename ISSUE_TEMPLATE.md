Make sure you have provided the following information:

 - [X] link to your code branch cloned from rhboot/shim-review in the form user/repo@tag
 [MiraySoftware/shim-review@miraysoftware-shim-x64-20210324](https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20210324)
 - [X] completed README.md file with the necessary information
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20210324/README.md
 - [X] shim.efi to be signed
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20210324/shim_mirayx64.efi
 - [X] public portion of your certificate embedded in shim (the file passed to VENDOR_CERT_FILE)
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20210324/MiraySoftwareAG2020.DER.cer
 - [X] binaries, for which hashes are added do vendor_db ( if you use vendor_db and have hashes allow-listed )
 Not used
 - [X] any extra patches to shim via your own git tree or as files
 No extra patches
 - [X] any extra patches to grub via your own git tree or as files
 https://github.com/MiraySoftware/grub2/tree/sysload_2_6
 - [X] build logs
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20210324/build.log


###### What organization or people are asking to have this signed:

We are the Miray Software AG, producers of microkernel OS "Symobi" and the
widely known Stand-Alone-Tools "HDClone" and "HDShredder" as well as other
hardware related tools, running without an installed operating system.
https://www.miray-software.com/

###### What product or service is this for:

The product is a Self-Booting system (typically from a USB flash drive or a CD,
containing one of our Stand-Alone-Tools, based on either our own microkernel
OS "Symobi" or a Linux kernel with our application framework on top.
A similar version, which runs as a normal Windows application, also exists, but
isn't actually considered to be "Stand-Alone", as it requires an existing
Windows installation and is limited in several aspects that require direct
hardware access.

We have used a Microsoft SecureBoot signed Shim since 2014 and the focus and
requirements of our products have not changed since then.


###### Please create your shim binaries starting with the 15.3 shim release tar file:
###### https://github.com/rhboot/shim/releases/download/15.3/shim-15.3.tar.bz2
###### This matches https://github.com/rhboot/shim/releases/tag/15.3 and contains
###### the appropriate gnu-efi source.
###### Please confirm this as the origin your shim.

Yes we use https://github.com/rhboot/shim/releases/download/15.3/shim-15.3.tar.bz2


###### What's the justification that this really does need to be signed for the whole world to be able to boot it:

We make software tools for Data Cloning, Backup/Recovery and Secure Deletion,
as well as other specialized tools for computer technicians, companies and
industrial use. Our tools are well known and used worldwide in more than 160
countries. Many of the tasks our software performs requires direct hardware 
access and is usually not possible to perform under a Windows environment.
Especially restoring system backups, deployment of master images, data
rescue and forensic imaging requires our software to boot directly on
SecureBoot systems.

###### How do you manage and protect the keys used in your SHIM?

Keys are stored in a hardware token. Access to the token is restricted.

###### Do you use EV certificates as embedded certificates in the SHIM?

Yes, EV certificate issued by DigiCert.

###### If you use new vendor_db functionality, are any hashes allow-listed, and if yes: for what binaries ?

Not used, no binaries allow-listed

###### Is kernel upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 present in your kernel, if you boot chain includes a Linux kernel ?

Yes, we currently use linux lts kernel 5.10.14:
75b0cea7bf307f362057cc778efe89af4c615354 was merged to upstream linux version 5.7.7

###### if SHIM is loading GRUB2 bootloader, are CVEs CVE-2020-14372,
###### CVE-2020-25632, CVE-2020-25647, CVE-2020-27749, CVE-2020-27779,
###### CVE-2021-20225, CVE-2021-20233, CVE-2020-10713, CVE-2020-14308,
###### CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
###### ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
###### and if you are shipping the shim_lock module CVE-2021-3418
###### fixed ?

Yes, all included.

Grub is branched from 2.06-rc1

###### "Please specifically confirm that you add a vendor specific SBAT entry for SBAT header in each binary that supports SBAT metadata
###### ( grub2, fwupd, fwupdate, shim + all child shim binaries )" to shim review doc ?
###### Please provide exact SBAT entries for all SBAT binaries you are booting or planning to boot directly through shim

Shim:
<upstream entries>
shim.miray,1,Miray Software,shim,miray-15.3,https://www.miray-software.com

Grub:
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
grub,1,Free Software Foundation,grub,2.04,https://www.gnu.org/software/grub/
grub.miray,1,Miray Software,grub2,sysload_$(VERSION),https://github.com/MiraySoftware/grub2

Symobi: We plan to use
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
symobi,1,Miray Software,Symobi,$(VERSION),https://www.miray-software.com
symobi.miray,1,Miray Software,Symobi,$(VERSION),https://www.miray-software.com

Linux: We will add something akin the following line as soon as possible:
<upstream entries>
$(LINUX).miray,1,Miray Software,Linux kernel,$(VERSION),https://www.miray-software.com

##### Were your old SHIM hashes provided to Microsoft ?

Hashes for SHIMs signed before July 2020 provided through keybase
No SHIM signed after July 2020

##### Did you change your certificate strategy, so that affected by CVE-2020-14372, CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
##### CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
##### CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705 ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
##### grub2 bootloaders can not be verified ?

July 2020 grub2 CVE list:
New shim uses a new certificate that has not signed any Grub vulnerable to July 2020 grub2 CVE list.
Previous certificate is not included.

March 2021 grub2 CVE list:
Shim checks vor SBAT section. No vulnerable Grub contains a SBAT section. 
Additionally: Grub versions that might be vulnerable to March 2021 grub2 CVE list deny-listed through VENDOR_DBX.
Chainloader module is disabled, so Grub cannot be used to circumvent SBAT checks in Shim.

##### What exact implementation of Secureboot in grub2 ( if this is your bootloader ) you have ?
##### * Upstream grub2 shim_lock verifier or * Downstream RHEL/Fedora/Debian/Canonical like implementation ?

We use upstream grub2 lockdown + shim_lock verifier. 

We also pull patches from Fedora for the linux loader, but the verification code of those patches will only get
used if secureboot is active but lockdown is not. (To our knowledge this should never happen)

We disable most loaders as it is done in the Fedora downstream code.

###### What is the origin and full version number of your bootloader (GRUB or other)?

Bootloader based on GRUB 2.06-rc1

The GRUB tree is available from
https://github.com/MiraySoftware/grub2/tree/sysload_2_6

Patches include 
- EFI net patches from fedora
- Secureboot patches for linux from fedora
- Secureboot adjustments to use upstream grub lockdown checks instead of secureboot checks
- Multiboot protocl adjustments and allowing it in secureboot
- custom menu code

###### If your SHIM launches any other components, please provide further details on what is launched

Shim is only used to launch the GRUB based bootloader.
Grub launches Linux kernel and Symobi kernel.

###### If your GRUB launches any other binaries that are not Linux kernel in SecureBoot mode,
###### please provide further details on what is launched and how it enforces Secureboot lockdown

We launch our own microkernel operating system Symobi through the multiboot or multiboot2 protocol.
More details on that in the kernel section.


###### If you are re-using a previously used (CA) certificate, you
###### will need to add the hashes of the previous GRUB2 binaries
###### exposed to the CVEs to vendor_dbx in shim in order to prevent
###### GRUB2 from being able to chainload those older GRUB2 binaries. If
###### you are changing to a new (CA) certificate, this does not
###### apply. Please describe your strategy.

We switched to a new certificate in 2020, no grub vulnerable to the 
July 2020 grub2 CVE list was signed with that certificate.

Grub versions that might be vulnerable to the March 2021 grub2 CVE list are 
included in the vendor_dbx list.


###### How do the launched components prevent execution of unauthenticated code?

Loaded code is validated through shim.
Linux and Symobi are validated through upstream shim_lock.
Other grub loader modules are blocked while SecureBoot is active.

###### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?

No, we use SHIM only to load GRUB2 with shim_lock module and SecureBoot patches from rhboot.
Chainloader module is disabled in GRUB2
kexec is disabled in Linux
Symobi does not support loading other kernels

###### What kernel are you using? Which patches does it includes to enforce Secure Boot?

* Linux: Version 5.10.14 with additional lockdown patches from Debian.
  - Automatic lockdown if booted in SecureBoot
  - Linux option to start other kernels (kexec) is DISABLED
  - Applied patches are
    * features/all/lockdown/efi-add-an-efi_secure_boot-flag-to-indicate-secure-b.patch
    * features/all/lockdown/efi-lock-down-the-kernel-if-booted-in-secure-boot-mo.patch
    * features/all/lockdown/mtd-disable-slram-and-phram-when-locked-down.patch
    * features/all/lockdown/arm64-add-kernel-config-option-to-lock-down-when.patch
    The patches are currently available through
    https://salsa.debian.org/kernel-team/linux/tree/master/
    commit hash 20fd32da6e7e0ddc31f3af13de8d112d54e67d57

* Symobi:
  - Symobi is a microkernel operating system wiht a minimal kernel.
    Hardware drivers are loaded as separate processes from a core file system.
    The kernel validates the core file system against a SHA2 hash which
    is embedded in the signed kernel.
    Only drivers stored in that core file system are allowed to access hardware.
  - MMIO, I/O space and DMA access is only allowed for drivers in the core file system.
  - Symobi does NOT support changing or writing to ACPI data.
  - Manual hardware configuration is NOT supported.
    All hardware configuration is done through PCI and ACPI information
  - EFI Bootservices are disabled by GRUB before the operating system is started
  - Launching other kernels is NOT supported.
  - Access to kernel memory is restricted to the kernel itself.
  - Access to MSRs (Model specific register) is restricted to the kernel.
  - Symobi does NOT support swap files or hibernation.
  - IOMMU is used if available.


###### What changes were made since your SHIM was last signed?

Update from shim '12' to 'shim-15.3'
Renewed certificate
Dropped patch "Enable 32-on-64": Was needed to load 32-Bit OS Symobi, no longer used with SecureBoot enabled.
Dropped patch "FIX 32-on-64 support": Not needed any more (see previous point).
 

###### What is the SHA256 hash of your final SHIM binary?

Sha256 hash: eb5a30cdcc82a8d68cc0c43e5217571522da193a72fa7aebb26f399e9f63607a
