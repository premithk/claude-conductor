import * as fs from 'fs';
import * as path from 'path';

const PRODUCT_TEMPLATE = `# Initial Concept

[Describe what you want to build here]`;

const INITIAL_STATE = { last_successful_step: "" };

export const initializeProject = (rootDir: string) => {
  const conductorDir = path.join(rootDir, 'conductor');

  if (fs.existsSync(conductorDir)) {
    console.log('Conductor directory already exists. Skipping initialization.');
    return;
  }

  fs.mkdirSync(conductorDir, { recursive: true });

  fs.writeFileSync(path.join(conductorDir, 'product.md'), PRODUCT_TEMPLATE);
  fs.writeFileSync(path.join(conductorDir, 'setup_state.json'), JSON.stringify(INITIAL_STATE));

  console.log('Conductor project initialized successfully.');
};