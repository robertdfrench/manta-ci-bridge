# Application Image
We build this application image with Hashicorp Packer just to save time when
provisioning a new development host. The image should have anything we need
pulled in from pkgsrc and configured as much as is possible without having any
specific application knowledge. 

Node libraries are best managed by npm, so we don't factor those in at this
level. We also do not want this image to be aware of what its domain name will
be, in case we want to stand up an alternative instance for any reason.
