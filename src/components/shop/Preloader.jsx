"use client";
import { useEffect, useState } from "react";

export default function Preloader() {
    const [visible, setVisible] = useState(true);
    const [fadeOut, setFadeOut] = useState(false);

    useEffect(() => {
        // Start fading out after a brief delay
        const fadeTimer = setTimeout(() => {
            setFadeOut(true);
        }, 300);

        // Remove from DOM after transition completes
        const removeTimer = setTimeout(() => {
            setVisible(false);
        }, 900);

        return () => {
            clearTimeout(fadeTimer);
            clearTimeout(removeTimer);
        };
    }, []);

    if (!visible) return null;

    return (
        <div 
            id="preloader" 
            style={{
                transition: "opacity 0.6s ease, visibility 0.6s ease",
                opacity: fadeOut ? 0 : 1,
                visibility: fadeOut ? "hidden" : "visible",
            }}
        >
            <div className="jumper">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
    );
}
