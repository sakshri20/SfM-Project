#! /bin/bash
# ===== PBS OPTIONS =====
### Set the job name
#PBS -N "JobSFM"
### Run in the queue named "copperhead"
#PBS -q copperhead
### Specify the number of cpus for your job.
#PBS -l nodes=1:ppn=16:gpus=1
#PBS -l mem=64GB
#PBS -l walltime=24:00:00
# ==== Main ======
module load intel openmpi
module load cuda
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/users/sagarw10/opt/CGAL-4.9/lib

/users/sshriva3/opt/openMVS_updated/openmvs_build/bin/DensifyPointCloud /users/sshriva3/opt/openSFM/OpenSfM/data/dataset2_gdrive/openmvs/scene.mvs

/users/sshriva3/opt/openMVS_updated/openmvs_build/bin/ReconstructMesh /users/sshriva3/opt/openSFM/OpenSfM/data/dataset2_gdrive/openmvs/scene_dense.mvs

/users/sshriva3/opt/openMVS_updated/openmvs_build/bin/RefineMesh /users/sshriva3/opt/openSFM/OpenSfM/data/dataset2_gdrive/openmvs/scene_dense_mesh.mvs

/users/sshriva3/opt/openMVS_updated/openmvs_build/bin/TextureMesh /users/sshriva3/opt/openSFM/OpenSfM/data/dataset2_gdrive/openmvs/scene_dense_mesh_refine.mvs
