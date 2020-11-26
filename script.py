from mpi4py import MPI
from build import pymetis
import numpy as np

comm = MPI.COMM_WORLD
comm_addr = MPI._addressof(comm)
rank = comm.Get_rank()
size = comm.Get_size()


num_partition = 5
input_filename = "/home/ubuntu/in.bin"
output_filename = "/home/ubuntu/out.bin"
# comm.Gatherv(sendbuf=sendbuf, recvbuf=(recvbuf, sendcounts), root=root)

pymetis.metis_assignment(num_partition, input_filename,
                         output_filename, comm_addr)

if rank == 0:
    num_nodes = pymetis.num_nodes(input_filename)
    pymetis.merge_results(output_filename, size, num_nodes)
