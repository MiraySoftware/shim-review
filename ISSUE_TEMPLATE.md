Make sure you have provided the following information:

 - [X] link to your code branch cloned from rhboot/shim-review in the form user/repo@tag
 [MiraySoftware/shim-review@miraysoftware-shim-x64-20210607](https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20210607)
 - [X] completed README.md file with the necessary information
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20210607/README.md
 - [X] shim.efi to be signed
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20210607/shim_mirayx64.efi
 - [X] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20210607/MiraySoftwareAG2020.DER.cer
 - [X] binaries, for which hashes are added do vendor_db ( if you use vendor_db and have hashes allow-listed )
 Not used
 - [X] any extra patches to shim via your own git tree or as files
 https://github.com/MiraySoftware/shim/tree/miray-15.4-1
 - [X] any extra patches to grub via your own git tree or as files
 https://github.com/MiraySoftware/grub2/tree/sysload_2_6
 - [X] build logs
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20210607/build.log
 - [X] a Dockerfile to reproduce the build of the provided shim EFI binaries
 https://github.com/MiraySoftware/shim-review/tree/miraysoftware-shim-x64-20210607/Dockerfile


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


###### Please create your shim binaries starting with the 15.4 shim release tar file:
###### https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2
###### This matches https://github.com/rhboot/shim/releases/tag/15.4 and contains
###### the appropriate gnu-efi source.
###### Please confirm this as the origin your shim.

Our tree is based on https://github.com/rhboot/shim/tree/shim-15.4 which includes
https://github.com/rhboot/shim/releases/tag/15.4 


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
shim.miray,1,Miray Software,shim,miray-15.4-1,https://www.miray-software.com

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
No SHIM signed Between July 2020 and February 2021

Shim 15.3 has not been distributed.

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


> Side by side comparison against Coverage section of
> https://man7.org/linux/man-pages/man7/kernel_lockdown.7.html
>
> The whole section is in blockquotes
> Information about Symobi is added like this
> > parts are taken from the Coverage section are quoted separately
>
> Overview:
> The Symobi OS microkernel (Sphere) does not load any external components into kernel memory.
> In order to start the rest of the system, it needs to start user mode code (basic drivers
> and services), which is located in the "core file system". It is located in one blob/file,
> which is secured by SHA256 hash. This hash is embedded in the signed kernel image (both are
> built in the same process). The kernel will then validate the core file system with this hash
> before accessing it, therefore maintaining the chain of trust.
>
> Access to kernel memory (direct and indirect) is restricted to the microkernel only. All
> drivers run as user space processes, hence with zero access to kernel memory. Direct access
> to hardware resources other than memory (register space) is restricted to drivers loaded
> from the (verified) core file system.
>
> The above mechanisms are always in effect, independent from whether SecureBoot is active or not.
>
>
> > When lockdown is in effect, a number of features are disabled or
> > have their use restricted.  This includes special device files
> > and kernel services that allow direct access of the kernel image:
> >
> >        /dev/mem
> >        /dev/kmem
> >        /dev/kcore
> >        /dev/ioports
> >        BPF
> >        kprobes
> >
> > and the ability to directly configure and control devices, so as
> > to prevent the use of a device to access or modify a kernel
> > image:
>
> Special device files or other interfaces to access kernel memory are not provided.
> IO port access is only granted for drivers from the core file system.
>
> > * The use of module parameters that directly specify hardware
> >   parameters to drivers through the kernel command line or when
> >   loading a module.
>
> Directly specifying hardware parameters is not supported for any driver.
> Hardware drivers are configured through PCI or ACPI information or through
> fixed information stored in the core file system.
>
> > * The use of direct PCI BAR access.
>
> Direct PCI BAR access is only allowed for hardware drivers in the core file system.
>
> > * The use of the ioperm and iopl instructions on x86.
>
> ioperm and iopl functions are not available in Symobi.
>
> > * The use of the KD*IO console ioctls.
>
> KD*IO console ioctls or similar functionality is not available in Symobi.
>
> > * The use of the TIOCSSERIAL serial ioctl.
>
> Serial port configuration is not supported .
>
> > * The alteration of MSR registers on x86.
>
> Access to MSRs is restricted to the kernel.
>
> > * The replacement of the PCMCIA CIS.
>
> replacement of the PCMCIA CIS is not supported by Symobi.
>
> > * The overriding of ACPI tables.
>
> overriding of ACPI tables is not supported by Symobi.
>
> > * The use of ACPI error injection.
>
> ACPI error injection is not supported by Symobi.
>
> > * The specification of the ACPI RDSP address.
>
> specification of the ACPI RDSP address is not supported in Symobi.
>
> > * The use of ACPI custom methods.
>
> Custom ACPI methods are not supported by Symobi.
>
> > Certain facilities are restricted:
> >
> > * Only validly signed modules may be loaded (waived if the module
> >   file being loaded is vouched for by IMA appraisal).
>
> Kernel modules as in Linux are not supported in Symobi.
> Hardware access is only allowed for drivers in the core file system.
>
> > * Only validly signed binaries may be kexec'd (waived if the
>     binary image file to be executed is vouched for by IMA
>     appraisal).
>
> Kexec (or similar functionality) is not supported by Symobi.
>
> > * Unencrypted hibernation/suspend to swap are disallowed as the
> >   kernel image is saved to a medium that can then be accessed.
>
> Hibernation is not supported by Symobi.
>
> > * Use of debugfs is not permitted as this allows a whole range of
> >   actions including direct configuration of, access to and
> >   driving of hardware.
>
> debugfs is not supported in Symobi.
> Some hardware drivers can output current configuration information, but
> configuration or custom commands are not supported.
>
> > * IMA requires the addition of the "secure_boot" rules to the
> >   policy, whether or not they are specified on the command line,
> >   for both the built-in and custom policies in secure boot
> >   lockdown mode.
>
> We currently automatically inject a boot parameter through the multiboot
> command if SecureBoot is active and grub is locked down.
> This forces the use of an IOMMU.
> All other restrictions are always active, even if SecureBoot is not enabled.


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



###### What changes were made since your SHIM was last signed?

Last accepted review:
https://github.com/rhboot/shim-review/issues/145

sbat entry changed from
"shim.miray,1,Miray Software,shim,miray-15.4,https://www.miray-software.com"
to
"shim.miray,1,Miray Software,shim,miray-15.4-1,https://www.miray-software.com"

changed source from 
https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2
to git repository
https://github.com/MiraySoftware/shim/tree/miray-15.4-1

We added the folloring patches on top of the 'shim-15.4' release:

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


###### What is the SHA256 hash of your final SHIM binary?

Sha256 hash: bb84f1bb5b1ffd1542af322663dd5a092ae40458f6e3a97537cf974f2cd59e2e
