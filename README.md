# nonstationary_rl

Machine learning (ML) becomes an essential part of almost every electronic system. In general, deep learning agents are complex algorithms for optimizing multilayer neural networks of complex architecture. Controlling the training of such systems is impossible, while deploying and training of them is an open scientific issue. Research community is focused primarily on increasing the complexity of algorithms and the network architecture for solving new problems. While neural networks are used as reliable classifiers, and complex systems allow speech recognition, video, and the solution of complex tasks of finding policies. The use of malicious systems is very poorly understood and the impact on the simple functions of classifiers is limited. For example, the known methods of attack on image classifiers.

Adversarial input superimposed on a typical image may result in the classifier mislabeling the sample. A recent study, The approach is quite reliable;  showed that hostile examples could be printed on standard paper, and then photographed using a standard smartphone and still wacky systems.

Adversarial samples can be dangerous. For example, attackers can target autonomous vehicles with stickers or paint, surveillance cameras, or access identifiers.

Reinforcement training agents can also be manipulated with adversarial examples, according to a new study from the University of California at Berkeley, OpenAI and the University of Pennsylvania, "Competitions in an attack on neural network policies" and research from the University of Nevada at Reno, , learning policy "Induction attacks. The study shows that widely used RL algorithms, such as DQN, TRPO and A3C, are vulnerable to hostile source data. This can lead to poor performance even if there are too thin perturbations that a person can perceive them, which causes the agent to lower the pong paddle down when it should rise, or interferes with its ability to detect enemies in the Seaquest.

Cleverhans, an open source library developed jointly by Ian Goodfellow and Nicholas Peipnoth to check the vulnerabilities of your AI in opposing examples. However, it still focuses on the image classification.

Attempts to protect against case examples
Traditional methods for making machine learning models more reliable, such as weight reduction and loss, usually do not provide practical protection against rival examples. So far, only two methods have provided substantial protection.

Competition Learning: This is a brute force decision, where we simply generate many adversarial examples and explicitly train the model so as not to be deceived by each of them. Implementing open source adversary learning is available in the cleverhans library, and its use is illustrated in the following guide.

Defensive Distillation: This is a strategy in which we train the model to derive probabilities of various classes, and not complex decisions about which class to output. Probabilities are determined by an earlier model trained in the same task using hard class labels. This creates a model whose surface is smoothed in the directions that an attacker normally tries to use, making it difficult for them to detect hostile input settings that lead to incorrect categorization.
