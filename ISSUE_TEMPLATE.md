Make sure you have provided the following information:

 - [X] link to your code branch cloned from rhboot/shim-review in the form user/repo@tag
 [MiraySoftware/shim-review@miraysoftware-shim-x64-20201103](https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20201103)
 - [X] completed README.md file with the necessary information
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20201103/README.md
 - [X] shim.efi to be signed
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20201103/shim_mirayx64.efi
 - [X] public portion of your certificate embedded in shim (the file passed to VENDOR_CERT_FILE)
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20201103/MiraySoftwareAG2020.DER.cer
 - [X] binaries, for which hashes are added do vendor_db ( if you use vendor_db and have hashes whitelisted )
 Not used
 - [X] any extra patches to shim via your own git tree or as files
 No additional patches
 - [X] any extra patches to grub via your own git tree or as files
 https://github.com/MiraySoftware/grub2/tree/sysload_2_5
 - [X] build logs
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20201103/build.log


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

###### What is the origin and full version number of your shim?

We use 'shim-15.2' from rhboot/shim
https://github.com/rhboot/shim/tree/15.2


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

###### If you use new vendor_db functionality, are any hashes whitelisted, and if yes: for what binaries ?

Not used, no binaries whitelisted

###### Is kernel upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 present in your kernel, if you boot chain includes a linux kernel ?

Yes, we currently use linux lts kernel 5.4.51:
75b0cea7bf307f362057cc778efe89af4c615354 was merged to upstream linux version 5.4.50

###### if SHIM is loading grub2 bootloader, is CVE CVE-2020-10713 fixed ?

Yes

Grub is branched from GRUB upstream commit e7b8856f8be3292afdb38d2e8c70ad8d62a61e10:
'linux: Fix integer overflows in initrd size handling'

##### Did you change your certificate strategy, so that affected by CVE CVE-2020-10713 grub2 bootloaders can not be verified ?

New shim uses a new certificate.
No affected versions were signed with the new certificate.
Previous certificate is not included so affected grub2 bootloaders will not be accepted.

###### What is the origin and full version number of your bootloader (GRUB or other)?

Bootloader based on GRUB 2.04+e7b8856f8be3292afdb38d2e8c70ad8d62a61e10
That is the latest commit of the BootHole patches in grub upstream.

The GRUB tree is available from
https://github.com/MiraySoftware/grub2/tree/sysload_2_5

###### If your SHIM launches any other components, please provide further details on what is launched

Shim is only used to launch the GRUB based bootloader.

###### How do the launched components prevent execution of unauthenticated code?

Loaded code is validated through shim.
Linux is validated through linuxefi from fedora-33 branch of rhboot.
Other grub loader modules are blocked while SecureBoot is active.

###### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?

No, we use SHIM only to load GRUB2 with SecureBoot patches from rhboot.

###### What kernel are you using? Which patches does it includes to enforce Secure Boot?

* Linux: Version 5.4.51 with additional lockdown patches from Debian. Automatic lockdown if booted in SecureBoot
  Applied patches are
    features/all/lockdown/efi-add-an-efi_secure_boot-flag-to-indicate-secure-b.patch
    features/all/lockdown/efi-lock-down-the-kernel-if-booted-in-secure-boot-mo.patch
    features/all/lockdown/add-a-sysrq-option-to-lift-kernel-lockdown.patch
    features/all/lockdown/enable-cold-boot-attack-mitigation.patch
    features/all/lockdown/mtd-disable-slram-and-phram-when-locked-down.patch
    features/all/lockdown/arm64-add-kernel-config-option-to-lock-down-when.patch
  The patches are currently available through
  https://salsa.debian.org/kernel-team/linux/tree/master/
  commit hash bb116bf757073347c9297ed7276cfc42e413222c

###### What changes were made since your SHIM was last signed?

Update from shim '12' to 'shim-15.2'
Renewed certificate
Enabled HTTPBoot option
Dropped patch "Enable 32-on-64": Was needed to load 32-Bit OS Symobi, no longer used with SecureBoot enabled.
Dropped patch "FIX 32-on-64 support": Not needed any more (see previous point).
 

###### What is the hash of your final SHIM binary?
Sha256 hash: 2baaff424f7b588b57579aee845f7b961af54c3f3039849421a1e5ccb2870362
