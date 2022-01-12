pipeline {
    agent any
    environment {
        // AWS_ACCOUNT_ID="YOUR_ACCOUNT_ID_HERE"
        // AWS_DEFAULT_REGION="CREATED_AWS_ECR_CONTAINER_REPO_REGION" 
        IMAGE_REPO_NAME="ECR_REPO_NAME"
        IMAGE_TAG="IMAGE_TAG"
        // REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
    }
   
    stages {
        
        //  stage('Logging into AWS ECR') {
        //     steps {
        //         script {
        //         sh "aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"
        //         }
                 
        //     }
        // }
        
        stage('Cloning Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/sagiamar/dockerTest.git']]])     
            }
        }
  
    // Building Docker images
    stage('Building image') {
      steps{
          sh """
            docker build -t hello_world_SA .
          """
      }
    }
   
    // Uploading Docker images into AWS ECR
    // stage('Pushing to ECR') {
    //  steps{  
    //      script {
    //             sh "docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:$IMAGE_TAG"
    //             sh "docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}"
    //      }
    //     }
    //   }
    }
}




// pipeline {
//   agent { label "linux" }
//   stages {
//     stage("build") {
//       steps {
//         sh """
//           docker build -t hello_there .
//         """
//       }
//     }
//     stage("run") {
//       steps {
//         sh """
//           docker run --rm hello_there
//         """
//       }
//     }
//   }

// }
