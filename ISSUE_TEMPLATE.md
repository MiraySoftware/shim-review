Make sure you have provided the following information:

 - [X] link to your code branch cloned from rhboot/shim-review in the form user/repo@tag
 [MiraySoftware/shim-review@miraysoftware-shim-x64-20200807](https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20200807)
 - [X] completed README.md file with the necessary information
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20200807/README.md
 - [X] shim.efi to be signed
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20200807/shim_mirayx64.efi
 - [X] public portion of your certificate embedded in shim (the file passed to VENDOR_CERT_FILE)
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20200807/MiraySoftwareAG2020.DER.cer
 - [X] any extra patches to shim via your own git tree or as files
 https://github.com/MiraySoftware/shim/tree/miray-15.1
 - [X] any extra patches to grub via your own git tree or as files
 https://github.com/MiraySoftware/grub2/tree/sysload_2_5
 - [X] build logs
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20200807/build.log


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

Shim is based on 'shim-15.1' from rhboot/shim
https://github.com/rhboot/shim/tree/shim-15.1

The tree with patches can be found at
https://github.com/MiraySoftware/shim/tree/miray-15.1

We enable support to verify 32bit kernels on 64bit systems for our own operating systems

###### What's the justification that this really does need to be signed for the whole world to be able to boot it:

We make software tools for Data Cloning, Backup/Recovery and Secure Deletion,
as well as other specialized tools for computer technicians, companies and
industrial use. Our tools are well known and used worldwide in more than 160
countries. Many of the tasks our software performs requires direct hardware 
access and is usually not possible to perform under a Windows environment.
Especially restoring system backups and master images requires our software
to boot directly on SecureBoot systems.

###### How do you manage and protect the keys used in your SHIM?

Keys are stored in a hardware token. Access to the token is restricted.

###### Do you use EV certificates as embedded certificates in the SHIM?

Yes, EV certificate issued by DigiCert.

###### What is the origin and full version number of your bootloader (GRUB or other)?

Bootloader based on GRUB 2.04+e7b8856f8be3292afdb38d2e8c70ad8d62a61e10
That commit is currently the upstream HEAD and includes the BootHole patches

The GRUB tree is available from
https://github.com/MiraySoftware/grub2/tree/sysload_2_5

###### If your SHIM launches any other components, please provide further details on what is launched

Shim is only used to launch a GRUB 2.04 based bootloader.

###### How do the launched components prevent execution of unauthenticated code?

GRUB 2.04 uses shim_lock verification to validate loaded kernels
BootHole patches are applied

###### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?

No, our GRUB flavor does not load any unsigned kernels when SecureBoot mode is active
We use a modified GRUB based on current trunk with shim_lock verifier module.
GRUB includes the upstream BootHole patches

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

* Symobi: 
  - EFI Bootservices are disabled by GRUB before the operating system is started
  - Hardware access is limited to kernel and drivers stored in core file system  
  - Kernel validates core file system against SHA2 hash embedded in the signed kernel. 

###### What changes were made since your SHIM was last signed?

Update from shim '12' to 'shim-15.1'
Renewed certificate
Added 'Check PxeReplyReceived as fallback in netboot' patch 
Enabled HTTPBoot option

###### What is the hash of your final SHIM binary?
Sha256 hash: 997a16266f105da86252d1801f95c02e7c4f570892c35f16f3d122c1ecd2dc71
