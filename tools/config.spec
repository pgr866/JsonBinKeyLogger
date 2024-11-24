# -*- mode: python ; coding: utf-8 -*-

import os
import sys

current_path = os.path.dirname(os.path.dirname(os.path.abspath(sys.argv[0])))
py_path = os.path.join(current_path, "main.py")
icon_path = os.path.join(current_path, "icon.ico")

datas = [(py_path, ".")]

a = Analysis(
    [py_path],
    pathex=["."],
    binaries=[],
    datas=datas,
    hiddenimports=[],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
)

pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.datas,
    [],
    name='SecurityHealthService',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=False,
    disable_windowed_traceback=True,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon=[icon_path] if os.name == 'nt' else [],
)