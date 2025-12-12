export default {
  preset: 'ts-jest',
  testEnvironment: 'node',
  roots: ['<rootDir>/server/src'],
  testMatch: ['**/__tests__/**/*.ts', '**/?(*.)+(spec|test).ts'],
  transform: {
    '^.+\\.ts$': 'ts-jest',
  },
  moduleNameMapper: {
    '^@/(.*)$': '<rootDir>/server/src/$1',
  },
  setupFilesAfterEnv: ['<rootDir>/server/src/test-setup.ts'],
  collectCoverageFrom: [
    'server/src/**/*.ts',
    '!server/src/**/*.test.ts',
    '!server/src/**/*.spec.ts',
    '!server/src/test-setup.ts',
  ],
};