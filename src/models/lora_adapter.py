"""
lora_adapter.py
~~~~~~~~~~~~~~~

Clase auxiliar que inserta adaptadores LoRA en NLLB-200.
— TODO —
* Recibir modelo y config (r, alpha, dropout, capas destino).
* Devolver modelo preparado para fine-tuning eficiente.
"""
from typing import Any

class LoraNLLBAdapter:
    def __init__(self, base_model: Any, r: int = 8, alpha: int = 16):
        self.base_model = base_model
        self.r = r
        self.alpha = alpha
        # TODO: inyectar adaptadores con PEFT

    def inject_adapters(self):
        raise NotImplementedError("Inyección LoRA pendiente.")
