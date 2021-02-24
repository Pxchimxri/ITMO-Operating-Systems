net share temp=C:\WIN-JE23C730F2B\temp
xcopy /zy c:\images\1.jpg \WIN-JE23C730F2B\temp
schtasks /Create /SC minute /tn copy.cmd /tr C:\ITMO-Operating-Systems\lab6\copy.cmd
schtasks /End /tn copy.cmd
comp c:\images\1.jpg c:\WIN-JE23C730F2B\temp\1.jpg
schtasks /Run /tn copy.cmd