from mpi4py import MPI
from build import pymetis

comm = MPI.COMM_WORLD
comm_addr = MPI._addressof(comm)

num_partition = 3

pymetis.metis_assignment(num_partition, "/tmp/in.bin",
                         "/tmp/out.bin", comm_addr)
