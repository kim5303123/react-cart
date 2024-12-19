import { useState } from "react";

function CartInput({ addNewItem }) {
  const [inputValue, setInputValue] = useState("");

  return (
    <section>
      <input
        type="text"
        value={inputValue}
        onChange={(event) => {
          setInputValue(event.target.value);
        }}
      />
      <button
        onClick={() => {
          if (inputValue.trim() !== "") {
            // 추가
            addNewItem(inputValue);
            setInputValue("");
          }
        }}
      >
        추가
      </button>
    </section>
  );
}
export default CartInput;
