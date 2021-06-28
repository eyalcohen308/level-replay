# Prioritized Level Replay

This is a PyTorch implementation of [Prioritized Level Replay](https://arxiv.org/abs/2010.03934).

Prioritized Level Replay is a simple method for improving generalization and sample-efficiency of deep RL agents on procedurally-generated environments by adaptively updating a sampling distribution over the training levels based on a score of the learning potential of replaying each level. 

![PLR algorithm overview](docs/plr-algo-overview.png)

## Requirements
```
conda create -n level-replay python=3.8
conda activate level-replay

git clone https://github.com/facebookresearch/level-replay.git
cd level-replay
pip install -r requirements.txt

# Clone level-replay-compatible versions of Procgen and MiniGrid environments.
git clone https://github.com/minqi/procgen.git
cd procgen 
python setup.py install
cd ..

git clone https://github.com/minqi/gym-minigrid .git
cd gym-minigrid 
pip install -e .
cd ..
```

## Training
For training the model use the runing shell script as follow:
```
./run_script <type_of_loss> <serial_number_of_maze_type>
```
types of loss: [1: "l1", 2: "uniform"]
types of maze: [1: "Multiroom-N4-Random", 2: "ObstructedMazeGamut-Easy", 3: "ObstructedMazeGamut-Medium"]
### Running example
```
./run_script uniform 2
```
will train the model with ppo algorithm, l1 loss and on "ObstructedMazeGamut-Easy" maze.

## MiniGrid results
Likewise, Prioritized Level Replay results in drastic improvements to hard exploration environments in MiniGrid. On MiniGrid, we directly observe that the selective sampling employed by this method induces an implicit curriculum over levels from easier to harder levels.

![MiniGrid results](docs/minigrid-results.png)

## Acknowledgements
The PPO implementation is largely based on Ilya Kostrikov's excellent implementation (https://github.com/ikostrikov/pytorch-a2c-ppo-acktr-gail) and Roberta Raileanu's specific integration with Procgen (https://github.com/rraileanu/auto-drac).

## Citation
If you make use of this code in your own work, please cite our paper:
```bib
@misc{jiang2020prioritized,
      title={{Prioritized Level Replay}}, 
      author={Minqi Jiang and Edward Grefenstette and Tim Rockt\"{a}schel},
      year={2020},
      eprint={2010.03934},
      archivePrefix={arXiv},
      primaryClass={cs.LG}
}
```

## License
The code in this repository is released under Creative Commons Attribution-NonCommercial 4.0 International License (CC-BY-NC 4.0).