# 📄 Resume

Welcome to my **Resume** repository! This project compiles my resume using LaTeX and GitHub Actions for automation, ensuring a professional and polished PDF output.

## 🚀 Features

- 🖋️ Written in LaTeX for high-quality typesetting.
- 🔄 Automated compilation using GitHub Actions.
- 🐳 Dockerized environment for consistent builds.
- 📂 Organized project structure for easy maintenance.

## 📂 Project Structure

```bash
resume/
├── .github/
│   └── workflows/
│       └── compile.yml      
├── data/
    └── resume.tex                
├── out/
    └── resume.aux
    └── resume.log
    └── resume.out
    └── resume.pdf                        
├── Dockerfile                
├── action.yml                
└── README.md
```
 # 🛠️ Usage

## 🐳 Using Docker

1. **Build the Docker image:**

    ```sh
    docker build -t resume-builder .
    ```

2. **Run the Docker container:**

    ```sh
    docker run --rm -v $(pwd):/usr/src/app resume-builder
    ```

## 💻 Using GitHub Actions

1. **Push changes to the repository:**

    ```sh
    git add .
    git commit -m "Update resume"
    git push origin main
    ```

2. **GitHub Actions will automatically compile your resume and update `resume.pdf` in the `out/` directory.**

## 📦 Direct Compilation (Local Environment)

1. **Install LaTeX (e.g., TeX Live, MiKTeX).**

2. **Compile the LaTeX source file:**

    ```sh
    pdflatex resume.tex
    ```

# 🤝 Contributing

Contributions are welcome! Feel free to submit issues and pull requests.

1. **Fork the repository.**

2. **Create your feature branch:**

    ```sh
    git checkout -b feature/my-new-feature
    ```

3. **Commit your changes:**

    ```sh
    git commit -am 'Add some feature'
    ```

4. **Push to the branch:**

    ```sh
    git push origin feature/my-new-feature
    ```


# 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

# 🌟 Acknowledgements

- Thanks to the LaTeX community for the great tools and resources.
- Inspired by various LaTeX resume templates and GitHub Actions workflows.

# 📫 Contact

Feel free to reach out via [GitHub Issues](https://github.com/aditya26062003/resume/issues) for any questions or feedback.
              
