# DMR
Diagonal Matrices Regression to Capture Responses of Resistive Cross-Point Arrays with Parasitic Resistance Effects

DMR
----response.m: the responses of a resistive cross-point array with parasitic resistances
----regression.m: regression of the responses by DMR
----DMRC.m: calculate DMs
----DMRE.m: estimate DMs

IDMC
----database: MNIST database
----mlp: pre-trained mlp, 784-300-10
----mlp_backup: pre-trained mlp, 784-100-10
----compensationC.m: calculate the inverse of DMs for a layer
----compensationE.m: estimate the inverse of DMs for a layer
----IDMCC.m: calculate the inverse of DMs for a single array
----loadMlp.m: load the weight matrices of the mlp
----loadMNIST.m: load MNIST database

----MLP.m: get the accuracy of the mlp after mapping to neuromorphic systems without parasitic resistances
----MLP_R.m: get the accuracy of the mlp after mapping to neuromorphic systems with parasitic resistances
----MLP_RCC.m: recover the accuracy of the mlp after mapping to neuromorphic systems with parasitic resistances by IDMC, the inverse of DMs are calculated
----MLP_RCE.m: recover the accuracy of the mlp after mapping to neuromorphic systems with parasitic resistances by IDMC, the inverse of DMs are estimated

----normalMapping.m: mapping the mlp to neuromorphic systems
----realFc.m: get the output of a fully-connected layer in neuromorphic systems with parasitic resistances
----realFcwithIDMC.m: get the output of a fully-connected layer in neuromorphic systems with parasitic resistances after IDMC

----test1.m: get the accuracy with different array sizes and different parasitic line resistances
----test2.m: recover the accuracy with different array sizes and different parasitic line resistances by IDMC, the inverse of DMs are calculated
----test3.m: recover the accuracy with different array sizes and different parasitic line resistances by IDMC, the inverse of DMs are estimated
----main.m: run test, test2 and test3
