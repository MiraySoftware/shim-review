Make sure you have provided the following information:

 - [ ] link to your code branch cloned from rhboot/shim-review in the form user/repo@tag
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20200207
 - [ ] completed README.md file with the necessary information
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20200207/README.md
 - [ ] shim.efi to be signed
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20200207/shim_miray64.efi
 - [ ] public portion of your certificate embedded in shim (the file passed to VENDOR_CERT_FILE)
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20200207/2017.codesigning.ev.msa.cer
 - [ ] any extra patches to shim via your own git tree or as files
 https://github.com/MiraySoftware/shim@miray-15
 - [ ] any extra patches to grub via your own git tree or as files
 https://github.com/MiraySoftware/grub2@sysload_2_4
 - [ ] build logs
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20200207/build.log


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
isn’t actually considered to be "Stand-Alone", as it requires an existing
Windows installation and is limited in several aspects that require direct
hardware access.

We have used a Microsoft SecureBoot signed Shim since 2014 and the focus and
requirements of our products have not changed since then.

###### What is the origin and full version number of your shim?

Shim is based on shim 15 from rhboot/shim

https://github.com/MiraySoftware/shim@miray-15

We enable support to verify 32bit kernels on 64bit systems for our own operating systems

###### What's the justification that this really does need to be signed for the whole world to be able to boot it:

We make software tools for Data Cloning, Backup/Recovery and Secure Deletion,
as well as other specialized tools for computer technicians, companies and
industrial use. Our tools are well known and used worldwide in more than 160
countries. Many of the tasks our software performs requires direct hardware 
acces and is usually not possible to perform under a Windows environment.
Especially restoring system backups and master images requires our software
to boot directly on SecureBoot systems.

###### How do you manage and protect the keys used in your SHIM?

Keys are stored in a hardware token. Access to the token is restricted.

###### Do you use EV certificates as embedded certificates in the SHIM?

Yes, EV certificate issued by DigiCert.

###### What is the origin and full version number of your bootloader (GRUB or other)?

Bootloader based on GRUB 2.04
https://github.com/MiraySoftware/grub2@sysload_2_4

###### If your SHIM launches any other components, please provide further details on what is launched

Shim is only used to launch a GRUB 2.04 based bootloader.

###### How do the launched components prevent execution of unauthenticated code?

GRUB 2.04 uses shim_lock verification to validate loaded kernels

###### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?

No, our GRUB flavor does not load any unsigned kernels when SecureBoot mode is active
We use a modified GRUB 2.04 with shim_lock verifier.

###### What kernel are you using? Which patches does it includes to enforce Secure Boot?

* linux: Version 5.4.15 with additional lockdown patches from Debian. Automatic lockdown if booted in SecureBoot
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

* Symobi: Hardware access limited to the drivers stored in the same binary package as the Microkernel.

###### What changes were made since your SHIM was last signed?

Update from shim 12 to shim 15

###### What is the hash of your final SHIM binary?
Sha256 hash: 51da17708979ae9906aaf5d9cccf32790bfd5c0623fc83fb7b964e5d165003f4
