#!/usr/bin/env python
# setup.py generated by flit for tools that don't yet use PEP 517

from distutils.core import setup

packages = \
['cattqt']

package_data = \
{'': ['*']}

entry_points = \
{'console_scripts': ['catt-qt = cattqt:main']}

setup(name='cattqt',
      version='4.0',
      description='A control GUI for Chromecasts',
      author='Scott Moreau',
      author_email='oreaus@gmail.com',
      url='https://github.com/soreau/catt-qt',
      packages=packages,
      package_data=package_data,
      entry_points=entry_points,
     )
