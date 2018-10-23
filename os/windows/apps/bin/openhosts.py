#! /usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: iJiabao
# @Date:   2018-10-23 23:17:03
# @Last Modified by:   iJiabao
# @Last Modified time: 2018-10-24 00:01:31

import os,sys,ctypes

host_file = r"C:\Windows\System32\drivers\etc\hosts"
ctypes.windll.shell32.ShellExecuteW(None, "runas", 'notepad', host_file, None, 1)
