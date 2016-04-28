
trafficLights:     file format mach-o-x86-64


Disassembly of section .text:

0000000100000c80 <_main>:
   100000c80:	55                   	push   %rbp
   100000c81:	48 89 e5             	mov    %rsp,%rbp
   100000c84:	48 83 ec 30          	sub    $0x30,%rsp
   100000c88:	48 8d 7d e8          	lea    -0x18(%rbp),%rdi
   100000c8c:	48 8d 35 c9 02 00 00 	lea    0x2c9(%rip),%rsi        # 100000f5c <_change_light+0x8c>
   100000c93:	e8 28 00 00 00       	callq  100000cc0 <_init_traffic_light>
   100000c98:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   100000c9c:	48 8d 35 c3 02 00 00 	lea    0x2c3(%rip),%rsi        # 100000f66 <_change_light+0x96>
   100000ca3:	e8 18 00 00 00       	callq  100000cc0 <_init_traffic_light>
   100000ca8:	48 8d 7d e8          	lea    -0x18(%rbp),%rdi
   100000cac:	48 8d 75 d0          	lea    -0x30(%rbp),%rsi
   100000cb0:	e8 5b 00 00 00       	callq  100000d10 <_run_canadian_traffic_lights>
   100000cb5:	31 c0                	xor    %eax,%eax
   100000cb7:	48 83 c4 30          	add    $0x30,%rsp
   100000cbb:	5d                   	pop    %rbp
   100000cbc:	c3                   	retq   
   100000cbd:	0f 1f 00             	nopl   (%rax)

0000000100000cc0 <_init_traffic_light>:
   100000cc0:	55                   	push   %rbp
   100000cc1:	48 89 e5             	mov    %rsp,%rbp
   100000cc4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   100000cc8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   100000ccc:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   100000cd0:	66 c7 06 03 00       	movw   $0x3,(%rsi)
   100000cd5:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   100000cd9:	66 c7 46 02 3c 00    	movw   $0x3c,0x2(%rsi)
   100000cdf:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   100000ce3:	66 c7 46 04 05 00    	movw   $0x5,0x4(%rsi)
   100000ce9:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   100000ced:	66 c7 46 06 0f 00    	movw   $0xf,0x6(%rsi)
   100000cf3:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   100000cf7:	66 c7 46 08 02 00    	movw   $0x2,0x8(%rsi)
   100000cfd:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
   100000d01:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
   100000d05:	48 89 77 10          	mov    %rsi,0x10(%rdi)
   100000d09:	5d                   	pop    %rbp
   100000d0a:	c3                   	retq   
   100000d0b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000100000d10 <_run_canadian_traffic_lights>:
   100000d10:	55                   	push   %rbp
   100000d11:	48 89 e5             	mov    %rsp,%rbp
   100000d14:	48 83 ec 30          	sub    $0x30,%rsp
   100000d18:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   100000d1c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   100000d20:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   100000d24:	48 8b 3e             	mov    (%rsi),%rdi
   100000d27:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   100000d2b:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
   100000d2f:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
   100000d33:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   100000d37:	48 89 75 e8          	mov    %rsi,-0x18(%rbp)
   100000d3b:	66 c7 45 d6 00 00    	movw   $0x0,-0x2a(%rbp)
   100000d41:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
   100000d45:	be 02 00 00 00       	mov    $0x2,%esi
   100000d4a:	e8 81 01 00 00       	callq  100000ed0 <_change_light>
   100000d4f:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
   100000d53:	31 f6                	xor    %esi,%esi
   100000d55:	e8 76 01 00 00       	callq  100000ed0 <_change_light>
   100000d5a:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
   100000d5e:	be 01 00 00 00       	mov    $0x1,%esi
   100000d63:	e8 68 01 00 00       	callq  100000ed0 <_change_light>
   100000d68:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
   100000d6c:	be 03 00 00 00       	mov    $0x3,%esi
   100000d71:	e8 5a 01 00 00       	callq  100000ed0 <_change_light>
   100000d76:	0f bf 75 d6          	movswl -0x2a(%rbp),%esi
   100000d7a:	81 fe 00 00 00 00    	cmp    $0x0,%esi
   100000d80:	0f 85 26 00 00 00    	jne    100000dac <_run_canadian_traffic_lights+0x9c>
   100000d86:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   100000d8a:	48 8b 08             	mov    (%rax),%rcx
   100000d8d:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
   100000d91:	48 8b 48 08          	mov    0x8(%rax),%rcx
   100000d95:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
   100000d99:	48 8b 40 10          	mov    0x10(%rax),%rax
   100000d9d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   100000da1:	66 c7 45 d6 01 00    	movw   $0x1,-0x2a(%rbp)
   100000da7:	e9 35 00 00 00       	jmpq   100000de1 <_run_canadian_traffic_lights+0xd1>
   100000dac:	0f bf 45 d6          	movswl -0x2a(%rbp),%eax
   100000db0:	3d 01 00 00 00       	cmp    $0x1,%eax
   100000db5:	0f 85 21 00 00 00    	jne    100000ddc <_run_canadian_traffic_lights+0xcc>
   100000dbb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   100000dbf:	48 8b 08             	mov    (%rax),%rcx
   100000dc2:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
   100000dc6:	48 8b 48 08          	mov    0x8(%rax),%rcx
   100000dca:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
   100000dce:	48 8b 40 10          	mov    0x10(%rax),%rax
   100000dd2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
   100000dd6:	66 c7 45 d6 00 00    	movw   $0x0,-0x2a(%rbp)
   100000ddc:	e9 00 00 00 00       	jmpq   100000de1 <_run_canadian_traffic_lights+0xd1>
   100000de1:	e9 5b ff ff ff       	jmpq   100000d41 <_run_canadian_traffic_lights+0x31>
   100000de6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
   100000ded:	00 00 00 

0000000100000df0 <_print_light_status>:
   100000df0:	55                   	push   %rbp
   100000df1:	48 89 e5             	mov    %rsp,%rbp
   100000df4:	48 83 ec 10          	sub    $0x10,%rsp
   100000df8:	48 8d 45 10          	lea    0x10(%rbp),%rax
   100000dfc:	48 8b 70 10          	mov    0x10(%rax),%rsi
   100000e00:	0f bf 38             	movswl (%rax),%edi
   100000e03:	48 89 75 f8          	mov    %rsi,-0x8(%rbp)
   100000e07:	e8 24 00 00 00       	callq  100000e30 <_cur_light_color>
   100000e0c:	48 8d 3d 5d 01 00 00 	lea    0x15d(%rip),%rdi        # 100000f70 <_change_light+0xa0>
   100000e13:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
   100000e17:	48 89 c2             	mov    %rax,%rdx
   100000e1a:	b0 00                	mov    $0x0,%al
   100000e1c:	e8 0b 01 00 00       	callq  100000f2c <_change_light+0x5c>
   100000e21:	89 45 f4             	mov    %eax,-0xc(%rbp)
   100000e24:	48 83 c4 10          	add    $0x10,%rsp
   100000e28:	5d                   	pop    %rbp
   100000e29:	c3                   	retq   
   100000e2a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000100000e30 <_cur_light_color>:
   100000e30:	55                   	push   %rbp
   100000e31:	48 89 e5             	mov    %rsp,%rbp
   100000e34:	66 89 f8             	mov    %di,%ax
   100000e37:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
   100000e3b:	0f bf 7d f6          	movswl -0xa(%rbp),%edi
   100000e3f:	89 f9                	mov    %edi,%ecx
   100000e41:	83 ef 03             	sub    $0x3,%edi
   100000e44:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   100000e48:	89 7d e4             	mov    %edi,-0x1c(%rbp)
   100000e4b:	0f 87 54 00 00 00    	ja     100000ea5 <_cur_light_color+0x75>
   100000e51:	48 8d 05 60 00 00 00 	lea    0x60(%rip),%rax        # 100000eb8 <_cur_light_color+0x88>
   100000e58:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
   100000e5c:	48 63 14 88          	movslq (%rax,%rcx,4),%rdx
   100000e60:	48 01 c2             	add    %rax,%rdx
   100000e63:	ff e2                	jmpq   *%rdx
   100000e65:	48 8d 05 0c 01 00 00 	lea    0x10c(%rip),%rax        # 100000f78 <_change_light+0xa8>
   100000e6c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   100000e70:	e9 3b 00 00 00       	jmpq   100000eb0 <_cur_light_color+0x80>
   100000e75:	48 8d 05 02 01 00 00 	lea    0x102(%rip),%rax        # 100000f7e <_change_light+0xae>
   100000e7c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   100000e80:	e9 2b 00 00 00       	jmpq   100000eb0 <_cur_light_color+0x80>
   100000e85:	48 8d 05 f9 00 00 00 	lea    0xf9(%rip),%rax        # 100000f85 <_change_light+0xb5>
   100000e8c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   100000e90:	e9 1b 00 00 00       	jmpq   100000eb0 <_cur_light_color+0x80>
   100000e95:	48 8d 05 f2 00 00 00 	lea    0xf2(%rip),%rax        # 100000f8e <_change_light+0xbe>
   100000e9c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   100000ea0:	e9 0b 00 00 00       	jmpq   100000eb0 <_cur_light_color+0x80>
   100000ea5:	48 8d 05 e6 00 00 00 	lea    0xe6(%rip),%rax        # 100000f92 <_change_light+0xc2>
   100000eac:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
   100000eb0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   100000eb4:	5d                   	pop    %rbp
   100000eb5:	c3                   	retq   
   100000eb6:	66 90                	xchg   %ax,%ax
   100000eb8:	ad                   	lods   %ds:(%rsi),%eax
   100000eb9:	ff                   	(bad)  
   100000eba:	ff                   	(bad)  
   100000ebb:	ff                   	(bad)  
   100000ebc:	bd ff ff ff cd       	mov    $0xcdffffff,%ebp
   100000ec1:	ff                   	(bad)  
   100000ec2:	ff                   	(bad)  
   100000ec3:	ff                   	(bad)  
   100000ec4:	dd ff                	(bad)  
   100000ec6:	ff                   	(bad)  
   100000ec7:	ff 0f                	decl   (%rdi)
   100000ec9:	1f                   	(bad)  
   100000eca:	84 00                	test   %al,(%rax)
   100000ecc:	00 00                	add    %al,(%rax)
	...

0000000100000ed0 <_change_light>:
   100000ed0:	55                   	push   %rbp
   100000ed1:	48 89 e5             	mov    %rsp,%rbp
   100000ed4:	48 83 ec 30          	sub    $0x30,%rsp
   100000ed8:	66 89 f0             	mov    %si,%ax
   100000edb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   100000edf:	66 89 45 f6          	mov    %ax,-0xa(%rbp)
   100000ee3:	66 8b 45 f6          	mov    -0xa(%rbp),%ax
   100000ee7:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
   100000eeb:	66 89 07             	mov    %ax,(%rdi)
   100000eee:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
   100000ef2:	48 8b 0f             	mov    (%rdi),%rcx
   100000ef5:	48 89 0c 24          	mov    %rcx,(%rsp)
   100000ef9:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   100000efd:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   100000f02:	48 8b 4f 10          	mov    0x10(%rdi),%rcx
   100000f06:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
   100000f0b:	e8 e0 fe ff ff       	callq  100000df0 <_print_light_status>
   100000f10:	48 0f bf 4d f6       	movswq -0xa(%rbp),%rcx
   100000f15:	48 8b 7d f8          	mov    -0x8(%rbp),%rdi
   100000f19:	0f bf 7c 4f 02       	movswl 0x2(%rdi,%rcx,2),%edi
   100000f1e:	e8 0f 00 00 00       	callq  100000f32 <_change_light+0x62>
   100000f23:	89 45 f0             	mov    %eax,-0x10(%rbp)
   100000f26:	48 83 c4 30          	add    $0x30,%rsp
   100000f2a:	5d                   	pop    %rbp
   100000f2b:	c3                   	retq   

Disassembly of section __TEXT.__stubs:

0000000100000f2c <__TEXT.__stubs>:
   100000f2c:	ff 25 de 00 00 00    	jmpq   *0xde(%rip)        # 100001010 <_change_light+0x140>
   100000f32:	ff 25 e0 00 00 00    	jmpq   *0xe0(%rip)        # 100001018 <_change_light+0x148>

Disassembly of section __TEXT.__stub_helper:

0000000100000f38 <__TEXT.__stub_helper>:
   100000f38:	4c 8d 1d c9 00 00 00 	lea    0xc9(%rip),%r11        # 100001008 <_change_light+0x138>
   100000f3f:	41 53                	push   %r11
   100000f41:	ff 25 b9 00 00 00    	jmpq   *0xb9(%rip)        # 100001000 <_change_light+0x130>
   100000f47:	90                   	nop
   100000f48:	68 00 00 00 00       	pushq  $0x0
   100000f4d:	e9 e6 ff ff ff       	jmpq   100000f38 <_change_light+0x68>
   100000f52:	68 0e 00 00 00       	pushq  $0xe
   100000f57:	e9 dc ff ff ff       	jmpq   100000f38 <_change_light+0x68>

Disassembly of section __TEXT.__unwind_info:

0000000100000f9c <__TEXT.__unwind_info>:
   100000f9c:	01 00                	add    %eax,(%rax)
   100000f9e:	00 00                	add    %al,(%rax)
   100000fa0:	1c 00                	sbb    $0x0,%al
   100000fa2:	00 00                	add    %al,(%rax)
   100000fa4:	00 00                	add    %al,(%rax)
   100000fa6:	00 00                	add    %al,(%rax)
   100000fa8:	1c 00                	sbb    $0x0,%al
   100000faa:	00 00                	add    %al,(%rax)
   100000fac:	00 00                	add    %al,(%rax)
   100000fae:	00 00                	add    %al,(%rax)
   100000fb0:	1c 00                	sbb    $0x0,%al
   100000fb2:	00 00                	add    %al,(%rax)
   100000fb4:	02 00                	add    (%rax),%al
   100000fb6:	00 00                	add    %al,(%rax)
   100000fb8:	80 0c 00 00          	orb    $0x0,(%rax,%rax,1)
   100000fbc:	34 00                	xor    $0x0,%al
   100000fbe:	00 00                	add    %al,(%rax)
   100000fc0:	34 00                	xor    $0x0,%al
   100000fc2:	00 00                	add    %al,(%rax)
   100000fc4:	2d 0f 00 00 00       	sub    $0xf,%eax
   100000fc9:	00 00                	add    %al,(%rax)
   100000fcb:	00 34 00             	add    %dh,(%rax,%rax,1)
   100000fce:	00 00                	add    %al,(%rax)
   100000fd0:	03 00                	add    (%rax),%eax
   100000fd2:	00 00                	add    %al,(%rax)
   100000fd4:	0c 00                	or     $0x0,%al
   100000fd6:	01 00                	add    %eax,(%rax)
   100000fd8:	10 00                	adc    %al,(%rax)
   100000fda:	01 00                	add    %eax,(%rax)
   100000fdc:	00 00                	add    %al,(%rax)
   100000fde:	00 00                	add    %al,(%rax)
   100000fe0:	00 00                	add    %al,(%rax)
   100000fe2:	00 01                	add    %al,(%rcx)
