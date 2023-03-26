
**Terraform-Taint**

In terraform we have an option to #taint the resource..
--Def : During the next apply, delete and recreate the resource---
**syntx = terraform taint <resource> <name of the resource>** eg-- terraform taint aws_subnet.subnet1.


>for example I have 4 subnets, and I want to make some changes to subnet 2.
>then every time when I apply It will delete the subnet2 and will recreate it.
***syntax = terraform taint aws_subnet.subnet[2]***

If we want to untaint the resource then,

***syntax = terraform untaint aws_subnet.subnet[2]***

