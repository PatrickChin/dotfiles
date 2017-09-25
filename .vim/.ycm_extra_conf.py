import os

def FlagsForFile( filename, **kwargs ):
  return {
    'flags': [
      '-Wall', '-Wextra', '-Werror', '-fexceptions', '-pthread',
      '-Wno-deprecated-declarations', '-m64',
      '-DNDEBUG', '-DUSE_CLANG_COMPLETER',
      '-std=c++1z', '-x c++',
      '-isystem', '/usr/include',
      '-isystem', '/usr/local/include',
      '-I', os.path.abspath('./include'),
    ]
  }

