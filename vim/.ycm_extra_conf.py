import os

def FlagsForFile( filename, **kwargs ):
  dirname = os.path.dirname(filename)
  return {
    'flags': [
      '-Wall', '-Wextra', '-Werror', '-fexceptions', '-pthread',
      '-ferror-limit=10000', '-Wno-deprecated-declarations', '-m64',
      '-DNDEBUG', '-DUSE_CLANG_COMPLETER',
      '-std=c++1z', '-x c++',
      '-isystem', '/usr/include',
      '-isystem', '/usr/local/include',
      '-I', dirname,
      '-I', os.path.join(dirname, './include'),
      '-I', os.path.join(dirname, '../include'),
    ],
    'do_cache': True
  }

