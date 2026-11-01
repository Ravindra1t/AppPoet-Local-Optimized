"""
AppPoet Logging Utilities
Provides unified logging and silences noisy third-party libraries (e.g., Androguard, Loguru).
"""

from __future__ import annotations

import logging
import sys


def setup_logger(name: str = "AppPoet", level: int = logging.INFO) -> logging.Logger:
    """
    Creates or configures a standard logger with a clean format.
    """
    # Silence third-party debug loggers
    silence_third_party_loggers()

    logger = logging.getLogger(name)
    if not logger.handlers:
        handler = logging.StreamHandler(sys.stdout)
        formatter = logging.Formatter(
            "[%(asctime)s] [%(levelname)s] [%(name)s] %(message)s",
            datefmt="%Y-%m-%d %H:%M:%S"
        )
        handler.setFormatter(formatter)
        logger.addHandler(handler)
        logger.setLevel(level)

    return logger


def silence_third_party_loggers() -> None:
    """
    Silences noisy third-party internal loggers (e.g. Androguard's loguru debug spew).
    """
    try:
        from loguru import logger as loguru_logger
        loguru_logger.disable("androguard")
    except ImportError:
        pass

    logging.getLogger("androguard").setLevel(logging.WARNING)
