import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExploreGpts extends StatefulWidget {
  const ExploreGpts({Key? key}) : super(key: key);

  @override
  State<ExploreGpts> createState() => _ExploreGptsState();
}

class _ExploreGptsState extends State<ExploreGpts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore GPTs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ChatGPT and OpenAI',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              SvgPicture.asset(
                  'assets/icons/openai-wordmark.svg',
                  height: 30
              ),
              SizedBox(height: 16),
              Text(
                'OpenAI is an artificial intelligence research lab consisting of the for-profit '
                    'OpenAI LP and its parent company, the non-profit OpenAI Inc. OpenAI aims to '
                    'advance digital intelligence in a way that is beneficial to humanity.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'ChatGPT is one of OpenAI\'s language models based on the GPT (Generative Pre-trained Transformer) architecture. '
                    'It is capable of understanding and generating human-like text based on the input it receives.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'How AI Works:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Artificial Intelligence involves the development of algorithms and models that enable machines to perform tasks that usually require human intelligence. '
                    'These tasks include learning, reasoning, problem-solving, perception, and language understanding.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'AI systems, like ChatGPT, are trained on large datasets and learn patterns and relationships in the data. '
                    'They use this knowledge to generate responses or predictions when presented with new inputs.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
