import { useEffect, useState } from 'react';
import { getFallbackItemUrl, getItemUrl } from '../helpers';
import { SlotWithItem } from '../typings';

export default function useItemUrl(item?: string | SlotWithItem) {
  const primaryUrl = item ? getItemUrl(item) : undefined;
  const [url, setUrl] = useState(primaryUrl);

  useEffect(() => {
    setUrl(primaryUrl);

    const fallbackUrl = getFallbackItemUrl(primaryUrl);
    if (!primaryUrl || !fallbackUrl) return;

    const image = new Image();
    image.onerror = () => setUrl(fallbackUrl);
    image.src = primaryUrl;

    return () => {
      image.onerror = null;
    };
  }, [primaryUrl]);

  return url;
}
