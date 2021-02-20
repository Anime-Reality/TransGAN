FROM continuumio/miniconda3
WORKDIR /msg_app

# Create the environment:
COPY environment.yml .
RUN conda env create -f environment.yml

# Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "py36", "/bin/bash", "-c"]

RUN python --version
RUN pip install extract-msg tqdm pandas jupyterlab openpyxl
EXPOSE 8888
CMD ["conda", "run", "--no-capture-output", "-n", "py36", "jupyter", "lab", "--ip='0.0.0.0'", "--port=8888", "--no-browser", "--allow-root"]