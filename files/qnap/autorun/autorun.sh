# autorun.sh

# Simple script to run one or more files on startup.

RUNDIR=/share/homes/admin/tenfourty-infrastructure-mgmt/files/qnap/autorun

if [ -d "$RUNDIR" ]
then
  for i in `ls ${RUNDIR}/*.run`; do echo "Running $i"; (cd ${RUNDIR} ; . $i) ; done
fi
